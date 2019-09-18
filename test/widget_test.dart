// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_testing_sentry/main.dart';

void main() {
  testWidgets('Login text test', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());
    expect(find.text('Login'), findsOneWidget);
  });
  
  testWidgets('empty email and password', (WidgetTester tester) async{
    await tester.pumpWidget(new MyApp());

    Finder email = find.byKey(new Key('email'));
    Finder pwd = find.byKey(new Key('password'));

    //print("Getting email widget");
    //print(email.toString());

    Finder formWidgetFinder = find.byType(Form);
    Form formWidget = tester.widget(formWidgetFinder) as Form;
    GlobalKey<FormState> formKey = formWidget.key as GlobalKey<FormState>;
    expect(formKey.currentState.validate(), isFalse);
  });

  testWidgets('email and password filled OK', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());

    Finder email = find.byKey(new Key('email'));
    Finder pwd = find.byKey(new Key('password'));

    await tester.enterText(email, "email@email.com");
    await tester.enterText(pwd, "123456textemptynot");
    await tester.pump();

    Finder formWidgetFinder = find.byType(Form);
    Form formWidget = tester.widget(formWidgetFinder) as Form;
    GlobalKey<FormState> formKey = formWidget.key as GlobalKey<FormState>;

    expect(formKey.currentState.validate(), isTrue);
  });

//  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//    // Build our app and trigger a frame.
//    await tester.pumpWidget(MyApp());
//
//    // Verify that our counter starts at 0.
//    expect(find.text('0'), findsOneWidget);
//    expect(find.text('1'), findsNothing);
//
//    // Tap the '+' icon and trigger a frame.
//    await tester.tap(find.byIcon(Icons.add));
//    await tester.pump();
//
//    // Verify that our counter has incremented.
//    expect(find.text('0'), findsNothing);
//    expect(find.text('1'), findsOneWidget);
//  });
}
