class AddressModel {
  final String id;
  final String name;
  final String address;
  final String email;
  final String phone;
  final bool isDefault;

  AddressModel({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
    this.isDefault = false,
  });
}

final List<AddressModel> mockAddresses = [
  AddressModel(
    id: '1',
    name: 'Theresa Webb',
    address: '3517 W. Gray St. Utica, Pennsylvania 57867',
    email: 'Willie.Jennings@Example.Com',
    phone: '(480) 555-0103',
    isDefault: true,
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
