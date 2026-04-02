class ChangeProfileField {
  const ChangeProfileField({
    required this.label,
    required this.value,
    this.highlight = false,
  });

  final String label;
  final String value;
  final bool highlight;
}

const String changeProfileName = 'Savannah Robertson';
const String changeProfileUsername = '@alexander02';
const String changeProfileAvatarUrl = 'lib/assets/home/maskgroup2.png';

const List<ChangeProfileField> changeProfileFields = [
  ChangeProfileField(label: 'Name', value: 'Savannah'),
  ChangeProfileField(label: 'Date of birth', value: 'Aug 21, 1992'),
  ChangeProfileField(label: 'Phone Number', value: '(214) 429 0123'),
  ChangeProfileField(label: 'Gender', value: 'Female'),
  ChangeProfileField(label: 'Email', value: 'Bill.sanders@example.com'),
  ChangeProfileField(label: 'Region', value: 'United States'),
  ChangeProfileField(
    label: 'Password',
    value: 'Change Password',
    highlight: true,
  ),
];
