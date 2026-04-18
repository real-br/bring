import 'package:flutter_test/flutter_test.dart';
import 'package:bring_app/main.dart';

void main() {
  testWidgets('App launches', (WidgetTester tester) async {
    await tester.pumpWidget(const BringApp());
    expect(find.text('Explore'), findsWidgets);
  });
}
