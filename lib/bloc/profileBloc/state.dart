class ProfileState {
  const ProfileState({
    this.fullName = 'Savannah Robertson',
    this.username = '@alexander02',
    this.avatarUrl = 'lib/assets/home/maskgroup2.png',
    this.dateOfBirth = 'Aug 21, 1992',
    this.phoneNumber = '(214) 429 0123',
    this.gender = 'Female',
    this.email = 'Bill.sanders@example.com',
    this.region = 'United States',
    this.draftFullName,
    this.draftUsername,
    this.draftDateOfBirth,
    this.draftPhoneNumber,
    this.draftGender,
    this.draftEmail,
    this.draftRegion,
  });

  final String fullName;
  final String username;
  final String avatarUrl;
  final String dateOfBirth;
  final String phoneNumber;
  final String gender;
  final String email;
  final String region;
  final String? draftFullName;
  final String? draftUsername;
  final String? draftDateOfBirth;
  final String? draftPhoneNumber;
  final String? draftGender;
  final String? draftEmail;
  final String? draftRegion;

  bool get hasDraftValues =>
      draftFullName != null ||
      draftUsername != null ||
      draftDateOfBirth != null ||
      draftPhoneNumber != null ||
      draftGender != null ||
      draftEmail != null ||
      draftRegion != null;

  String get formFullName => draftFullName ?? fullName;
  String get formUsername => draftUsername ?? username.replaceFirst('@', '');
  String get formDateOfBirth => draftDateOfBirth ?? dateOfBirth;
  String get formPhoneNumber => draftPhoneNumber ?? phoneNumber;
  String get formGender => draftGender ?? gender;
  String get formEmail => draftEmail ?? email;
  String get formRegion => draftRegion ?? region;

  String get previewFullName {
    final trimmed = formFullName.trim();
    return trimmed.isEmpty ? fullName : trimmed;
  }

  String get previewUsername {
    final trimmed = formUsername.trim();
    if (trimmed.isEmpty) {
      return username;
    }

    return trimmed.startsWith('@') ? trimmed : '@$trimmed';
  }

  ProfileState copyWith({
    String? fullName,
    String? username,
    String? avatarUrl,
    String? dateOfBirth,
    String? phoneNumber,
    String? gender,
    String? email,
    String? region,
    String? draftFullName,
    String? draftUsername,
    String? draftDateOfBirth,
    String? draftPhoneNumber,
    String? draftGender,
    String? draftEmail,
    String? draftRegion,
    bool resetDraft = false,
  }) {
    return ProfileState(
      fullName: fullName ?? this.fullName,
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      region: region ?? this.region,
      draftFullName: resetDraft ? null : draftFullName ?? this.draftFullName,
      draftUsername: resetDraft ? null : draftUsername ?? this.draftUsername,
      draftDateOfBirth: resetDraft
          ? null
          : draftDateOfBirth ?? this.draftDateOfBirth,
      draftPhoneNumber: resetDraft
          ? null
          : draftPhoneNumber ?? this.draftPhoneNumber,
      draftGender: resetDraft ? null : draftGender ?? this.draftGender,
      draftEmail: resetDraft ? null : draftEmail ?? this.draftEmail,
      draftRegion: resetDraft ? null : draftRegion ?? this.draftRegion,
    );
  }
}
