import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class UserInterfaceComponentPumpingAdapter {
  static Future<void> pumpWidget(WidgetTester tester, Widget widget) async {
    await tester.pumpWidget(MaterialApp(
      home: Column(
        children: [widget],
      ),
    ));
  }
}
