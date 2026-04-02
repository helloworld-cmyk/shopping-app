import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  static const Duration _autoSaveDelay = Duration(milliseconds: 500);

  Timer? _autoSaveTimer;

  ProfileBloc() : super(const ProfileState()) {
    on<ProfileFormStarted>(_onProfileFormStarted);
    on<ProfileFieldChanged>(_onProfileFieldChanged);
    on<ProfileAutoSaveTriggered>(_onProfileAutoSaveTriggered);
  }

  void _onProfileFormStarted(
    ProfileFormStarted event,
    Emitter<ProfileState> emit,
  ) {
    if (state.hasDraftValues) {
      return;
    }

    emit(
      state.copyWith(
        draftFullName: state.fullName,
        draftUsername: state.username.replaceFirst('@', ''),
        draftDateOfBirth: state.dateOfBirth,
        draftPhoneNumber: state.phoneNumber,
        draftGender: state.gender,
        draftEmail: state.email,
        draftRegion: state.region,
      ),
    );
  }

  void _onProfileFieldChanged(
    ProfileFieldChanged event,
    Emitter<ProfileState> emit,
  ) {
    emit(_copyWithDraftField(field: event.field, value: event.value));
    _scheduleAutoSave();
  }

  void _onProfileAutoSaveTriggered(
    ProfileAutoSaveTriggered event,
    Emitter<ProfileState> emit,
  ) {
    final savedFullName = _sanitizeText(
      state.formFullName,
      fallback: state.fullName,
    );
    final savedUsername = _sanitizeUsername(state.formUsername);
    final savedDateOfBirth = _sanitizeText(
      state.formDateOfBirth,
      fallback: state.dateOfBirth,
    );
    final savedPhoneNumber = _sanitizeText(
      state.formPhoneNumber,
      fallback: state.phoneNumber,
    );
    final savedGender = _sanitizeText(state.formGender, fallback: state.gender);
    final savedEmail = _sanitizeText(state.formEmail, fallback: state.email);
    final savedRegion = _sanitizeText(state.formRegion, fallback: state.region);

    emit(
      state.copyWith(
        fullName: savedFullName,
        username: savedUsername,
        dateOfBirth: savedDateOfBirth,
        phoneNumber: savedPhoneNumber,
        gender: savedGender,
        email: savedEmail,
        region: savedRegion,
        draftFullName: savedFullName,
        draftUsername: savedUsername.replaceFirst('@', ''),
        draftDateOfBirth: savedDateOfBirth,
        draftPhoneNumber: savedPhoneNumber,
        draftGender: savedGender,
        draftEmail: savedEmail,
        draftRegion: savedRegion,
      ),
    );
  }

  ProfileState _copyWithDraftField({
    required ProfileField field,
    required String value,
  }) {
    switch (field) {
      case ProfileField.fullName:
        return state.copyWith(draftFullName: value);
      case ProfileField.username:
        return state.copyWith(draftUsername: value);
      case ProfileField.dateOfBirth:
        return state.copyWith(draftDateOfBirth: value);
      case ProfileField.phoneNumber:
        return state.copyWith(draftPhoneNumber: value);
      case ProfileField.gender:
        return state.copyWith(draftGender: value);
      case ProfileField.email:
        return state.copyWith(draftEmail: value);
      case ProfileField.region:
        return state.copyWith(draftRegion: value);
    }
  }

  void _scheduleAutoSave() {
    _autoSaveTimer?.cancel();
    _autoSaveTimer = Timer(_autoSaveDelay, () {
      add(const ProfileAutoSaveTriggered());
    });
  }

  String _sanitizeText(String value, {required String fallback}) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? fallback : trimmed;
  }

  String _sanitizeUsername(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return state.username;
    }

    return trimmed.startsWith('@') ? trimmed : '@$trimmed';
  }

  @override
  Future<void> close() {
    _autoSaveTimer?.cancel();
    return super.close();
  }
}
