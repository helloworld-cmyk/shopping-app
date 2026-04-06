import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/address_model.dart';

import 'event.dart';
import 'state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(const AddressState()) {
    on<AddressFormStarted>(_onAddressFormStarted);
    on<AddressFormFieldChanged>(_onAddressFormFieldChanged);
    on<AddressCountryChanged>(_onAddressCountryChanged);
    on<AddressPhoneCodeChanged>(_onAddressPhoneCodeChanged);
    on<AddressDefaultChanged>(_onAddressDefaultChanged);
    on<AddressFormSubmitted>(_onAddressFormSubmitted);
    on<AddressFormFeedbackCleared>(_onAddressFormFeedbackCleared);
    on<AddAddress>(_onAddAddress);
    on<SelectAddress>(_onSelectAddress);
    on<DeleteAddress>(_onDeleteAddress);
  }

  void _onAddressFormStarted(
    AddressFormStarted event,
    Emitter<AddressState> emit,
  ) {
    emit(
      state.copyWith(
        resetForm: true,
        formStatus: AddressFormStatus.idle,
        clearFormMessage: true,
      ),
    );
  }

  void _onAddressFormFieldChanged(
    AddressFormFieldChanged event,
    Emitter<AddressState> emit,
  ) {
    switch (event.field) {
      case AddressFormField.firstName:
        emit(state.copyWith(firstName: event.value));
        return;
      case AddressFormField.lastName:
        emit(state.copyWith(lastName: event.value));
        return;
      case AddressFormField.street:
        emit(state.copyWith(street: event.value));
        return;
      case AddressFormField.city:
        emit(state.copyWith(city: event.value));
        return;
      case AddressFormField.phone:
        emit(state.copyWith(phone: event.value));
        return;
      case AddressFormField.email:
        emit(state.copyWith(email: event.value));
        return;
    }
  }

  void _onAddressCountryChanged(
    AddressCountryChanged event,
    Emitter<AddressState> emit,
  ) {
    emit(state.copyWith(selectedCountry: event.country));
  }

  void _onAddressPhoneCodeChanged(
    AddressPhoneCodeChanged event,
    Emitter<AddressState> emit,
  ) {
    emit(state.copyWith(phoneCode: event.phoneCode));
  }

  void _onAddressDefaultChanged(
    AddressDefaultChanged event,
    Emitter<AddressState> emit,
  ) {
    emit(state.copyWith(isDefault: event.isDefault));
  }

  void _onAddressFormSubmitted(
    AddressFormSubmitted event,
    Emitter<AddressState> emit,
  ) {
    final firstName = state.firstName.trim();
    final lastName = state.lastName.trim();
    final street = state.street.trim();
    final city = state.city.trim();
    final phone = state.phone.trim();
    final email = state.email.trim();

    final requiredValues = [firstName, lastName, street, city, phone, email];
    if (requiredValues.any((value) => value.isEmpty)) {
      emit(
        state.copyWith(
          formStatus: AddressFormStatus.validationError,
          formMessage: 'Please fill in all required fields.',
        ),
      );
      return;
    }

    final address = AddressModel(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: '$firstName $lastName',
      address: '$street, $city, ${state.selectedCountry}',
      email: email,
      phone: '${state.phoneCode} $phone',
    );

    final updatedAddresses = [...state.addresses, address];
    final shouldSelect = state.isDefault || state.selectedAddressId == null;

    emit(
      state.copyWith(
        addresses: updatedAddresses,
        selectedAddressId: shouldSelect ? address.id : state.selectedAddressId,
        resetForm: true,
        formStatus: AddressFormStatus.success,
        clearFormMessage: true,
      ),
    );
  }

  void _onAddressFormFeedbackCleared(
    AddressFormFeedbackCleared event,
    Emitter<AddressState> emit,
  ) {
    emit(
      state.copyWith(
        formStatus: AddressFormStatus.idle,
        clearFormMessage: true,
      ),
    );
  }

  void _onAddAddress(AddAddress event, Emitter<AddressState> emit) {
    final updatedAddresses = [...state.addresses, event.address];
    final shouldSelect =
        event.selectAsCurrent || state.selectedAddressId == null;

    emit(
      state.copyWith(
        addresses: updatedAddresses,
        selectedAddressId: shouldSelect
            ? event.address.id
            : state.selectedAddressId,
        formStatus: AddressFormStatus.idle,
        clearFormMessage: true,
      ),
    );
  }

  void _onSelectAddress(SelectAddress event, Emitter<AddressState> emit) {
    final exists = state.addresses.any(
      (address) => address.id == event.addressId,
    );
    if (!exists) {
      return;
    }

    emit(state.copyWith(selectedAddressId: event.addressId));
  }

  void _onDeleteAddress(DeleteAddress event, Emitter<AddressState> emit) {
    final updatedAddresses = state.addresses
        .where((address) => address.id != event.addressId)
        .toList();

    if (updatedAddresses.isEmpty) {
      emit(
        state.copyWith(addresses: updatedAddresses, clearSelectedAddress: true),
      );
      return;
    }

    final hasSelectedAddress = updatedAddresses.any(
      (address) => address.id == state.selectedAddressId,
    );

    emit(
      state.copyWith(
        addresses: updatedAddresses,
        selectedAddressId: hasSelectedAddress
            ? state.selectedAddressId
            : updatedAddresses.first.id,
      ),
    );
  }
}
