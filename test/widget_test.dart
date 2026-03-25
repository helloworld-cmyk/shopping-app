import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/main.dart';

void main() {
  testWidgets('App boots to splash flow', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(
      find.text('Copyright By NILAH - Designed By La-Studio'),
      findsOneWidget,
    );
  });
}
