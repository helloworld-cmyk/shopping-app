import 'state.dart';

sealed class AddressEvent {
  const AddressEvent();
}

enum AddressFormField { firstName, lastName, street, city, phone, email }

final class AddressFormStarted extends AddressEvent {
  const AddressFormStarted();
}

final class AddressFormFieldChanged extends AddressEvent {
  const AddressFormFieldChanged({required this.field, required this.value});

  final AddressFormField field;
  final String value;
}

final class AddressCountryChanged extends AddressEvent {
  const AddressCountryChanged(this.country);

  final String country;
}

final class AddressPhoneCodeChanged extends AddressEvent {
  const AddressPhoneCodeChanged(this.phoneCode);

  final String phoneCode;
}

final class AddressDefaultChanged extends AddressEvent {
  const AddressDefaultChanged(this.isDefault);

  final bool isDefault;
}

final class AddressFormSubmitted extends AddressEvent {
  const AddressFormSubmitted();
}

final class AddressFormFeedbackCleared extends AddressEvent {
  const AddressFormFeedbackCleared();
}

final class AddAddress extends AddressEvent {
  const AddAddress({required this.address, this.selectAsCurrent = true});

  final AddressModel address;
  final bool selectAsCurrent;
}

final class SelectAddress extends AddressEvent {
  const SelectAddress(this.addressId);

  final String addressId;
}

final class DeleteAddress extends AddressEvent {
  const DeleteAddress(this.addressId);

  final String addressId;
}
