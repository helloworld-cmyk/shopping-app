import '../../models/address_model.dart';
import '../../screens/address/address_mock_data.dart';

// [SOLID - SRP] Tách AddressModel ra file model riêng biệt để state file gọn nhẹ.
enum AddressFormStatus { idle, validationError, success }

const String _defaultCountry = 'UNITED STATES';
const String _defaultPhoneCode = '+1';

class AddressState {
  const AddressState({
    this.addresses = initialAddressesMockData,
    this.selectedAddressId = '1',
    this.firstName = '',
    this.lastName = '',
    this.street = '',
    this.city = '',
    this.phone = '',
    this.email = '',
    this.selectedCountry = _defaultCountry,
    this.phoneCode = _defaultPhoneCode,
    this.isDefault = true,
    this.formStatus = AddressFormStatus.idle,
    this.formMessage,
  });

  final List<AddressModel> addresses;
  final String? selectedAddressId;
  final String firstName;
  final String lastName;
  final String street;
  final String city;
  final String phone;
  final String email;
  final String selectedCountry;
  final String phoneCode;
  final bool isDefault;
  final AddressFormStatus formStatus;
  final String? formMessage;

  AddressModel? get selectedAddress {
    for (final address in addresses) {
      if (address.id == selectedAddressId) {
        return address;
      }
    }
    return null;
  }

  AddressState copyWith({
    List<AddressModel>? addresses,
    String? selectedAddressId,
    String? firstName,
    String? lastName,
    String? street,
    String? city,
    String? phone,
    String? email,
    String? selectedCountry,
    String? phoneCode,
    bool? isDefault,
    AddressFormStatus? formStatus,
    String? formMessage,
    bool clearSelectedAddress = false,
    bool clearFormMessage = false,
    bool resetForm = false,
  }) {
    return AddressState(
      addresses: addresses ?? this.addresses,
      selectedAddressId: clearSelectedAddress
          ? null
          : selectedAddressId ?? this.selectedAddressId,
      firstName: resetForm ? '' : firstName ?? this.firstName,
      lastName: resetForm ? '' : lastName ?? this.lastName,
      street: resetForm ? '' : street ?? this.street,
      city: resetForm ? '' : city ?? this.city,
      phone: resetForm ? '' : phone ?? this.phone,
      email: resetForm ? '' : email ?? this.email,
      selectedCountry: resetForm
          ? _defaultCountry
          : selectedCountry ?? this.selectedCountry,
      phoneCode: resetForm ? _defaultPhoneCode : phoneCode ?? this.phoneCode,
      isDefault: resetForm ? true : isDefault ?? this.isDefault,
      formStatus: formStatus ?? this.formStatus,
      formMessage: clearFormMessage ? null : formMessage ?? this.formMessage,
    );
  }
}
