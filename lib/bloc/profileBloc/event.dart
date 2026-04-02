sealed class ProfileEvent {
  const ProfileEvent();
}

enum ProfileField {
  fullName,
  username,
  dateOfBirth,
  phoneNumber,
  gender,
  email,
  region,
}

final class ProfileFormStarted extends ProfileEvent {
  const ProfileFormStarted();
}

final class ProfileFieldChanged extends ProfileEvent {
  const ProfileFieldChanged({required this.field, required this.value});

  final ProfileField field;
  final String value;
}

final class ProfileAutoSaveTriggered extends ProfileEvent {
  const ProfileAutoSaveTriggered();
}
