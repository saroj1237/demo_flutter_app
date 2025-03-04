import 'package:demo_flutter_app/app/app.dart';
import 'package:demo_flutter_app/features/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget( App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
