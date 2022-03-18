// ignore_for_file: avoid_print

//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:drone/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('You have pushed the button this many times:'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);

      final Finder fab = find.byTooltip('Increment1');

      await tester.tap(fab);

      await tester.pump();

      expect(find.text('1'), findsOneWidget);

      
    });
  });
}


















// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   group('end-to-end test', () {
//      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
//     testWidgets('tap on the floating action button, verify counter',
//         (WidgetTester tester) async {
//       app.main();
//       await tester.pumpAndSettle();

//       // Verify the counter starts at 0.
//       expect(find.text('0'), findsOneWidget);void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   group('end-to-end test', () {
//      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
//     testWidgets('tap on the floating action button, verify counter',
//         (WidgetTester tester) async {
//       app.main();
//       await tester.pumpAndSettle();

//       // Verify the counter starts at 0.
//       expect(find.text('0'), findsOneWidget);

//       // Finds the floating action button to tap on.
//       final Finder fab = find.byKey(Key('increment1'));

//       // Emulate a tap on the floating action button.
//       for (var i = 0; i < 100; i++) {
//         await tester.tap(fab);
      

      
//     }
//     // Trigger a frame.
//       await tester.pumpAndSettle();

//       // Verify the counter increments by 1.
//       expect(find.text('100'), findsOneWidget);
//     );
    
//   });



  

// }

//       final Finder fab = find.byKey(Key('increment1'));

//       // Emulate a tap on the floating action button.
//       for (var i = 0; i < 100; i++) {
//         await tester.tap(fab);
      

      
//     }
//     // Trigger a frame.
//       await tester.pumpAndSettle();

//       // Verify the counter increments by 1.
//       expect(find.text('100'), findsOneWidget);
//     );
    
//   });



  

// }
