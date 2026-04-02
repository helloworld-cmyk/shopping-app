class AddressModel {
  const AddressModel({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
  });

  final String id;
  final String name;
  final String address;
  final String email;
  final String phone;

  AddressModel copyWith({
    String? id,
    String? name,
    String? address,
    String? email,
    String? phone,
  }) {
    return AddressModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}

enum AddressFormStatus { idle, validationError, success }

const String _defaultCountry = 'UNITED STATES';
const String _defaultPhoneCode = '+1';

class AddressState {
  const AddressState({
    this.addresses = _initialAddresses,
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

const List<AddressModel> _initialAddresses = [
  AddressModel(
    id: '1',
    name: 'Theresa Webb',
    address: '3517 W. Gray St. Utica, Pennsylvania 57867',
    email: 'Willie.Jennings@Example.Com',
    phone: '(480) 555-0103',
  ),
  AddressModel(
    id: '2',
    name: 'Brooklyn Warren',
    address: '4517 Washington Ave. Manchester, Kentucky 39495',
    email: 'Jessica.Hanson@Example.Com',
    phone: '(629) 555-0129',
  ),
  AddressModel(
    id: '3',
    name: 'George Harrington',
    address: 'Turnridge Cir. Shiloh, Hawaii 81063',
    email: 'Reid@Example.Com',
    phone: '(480) 555-0121',
  ),
];
