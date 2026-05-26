import 'package:flutter_test/flutter_test.dart';
import 'package:futbolerosapp/main.dart';

void main() {
  testWidgets('Initial load smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our app starts with the expected text.
    expect(find.text('Futboleros App - Sogamoso Athletic System'), findsOneWidget);
  });
}
