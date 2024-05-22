import 'package:calculatorapp/infrastructure/specifications/user_interface_specifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Keyboard extends StatelessWidget {
  final List<Widget> _children;

  const Keyboard(this._children, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
        child: Container(
      padding: EdgeInsets.only(
          bottom: UserInterfaceSpecifications.isScreenHeightSmall(screenHeight)
              ? 8
              : 16,
          left: 16,
          right: 16,
          top: UserInterfaceSpecifications.isScreenHeightSmall(screenHeight)
              ? 16
              : 32),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: _children,
      ),
    ));
  }
}
