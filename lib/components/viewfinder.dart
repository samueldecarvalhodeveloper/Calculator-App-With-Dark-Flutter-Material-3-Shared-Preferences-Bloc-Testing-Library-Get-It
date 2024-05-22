import 'package:calculatorapp/infrastructure/specifications/user_interface_specifications.dart';
import 'package:calculatorapp/styles/colors/neutrals_colors.dart';
import 'package:calculatorapp/styles/colors/primary_colors.dart';
import 'package:flutter/material.dart';

class Viewfinder extends StatelessWidget {
  final String _value;
  final bool _isThemeDark;

  const Viewfinder(this._value, this._isThemeDark, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28)),
            color: _isThemeDark
                ? PrimaryColors.PRIMARY_600.value
                : PrimaryColors.PRIMARY_500.value),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 1, right: 1, left: 1),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28)),
                color: _isThemeDark
                    ? PrimaryColors.PRIMARY_700.value
                    : PrimaryColors.PRIMARY_100.value,
              ),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  child: Container(
                      constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width),
                      padding: EdgeInsets.only(
                          right: 16,
                          left: 16,
                          top: UserInterfaceSpecifications.isScreenHeightSmall(
                                  screenHeight)
                              ? 0
                              : 120,
                          bottom:
                              UserInterfaceSpecifications.isScreenHeightSmall(
                                      screenHeight)
                                  ? 8
                                  : 16),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        _value,
                        style: TextStyle(
                            color: _isThemeDark
                                ? NeutralsColors.NEUTRAL_100.value
                                : NeutralsColors.NEUTRAL_900.value,
                            fontWeight: FontWeight.w500,
                            fontSize:
                                UserInterfaceSpecifications.isScreenHeightSmall(
                                        screenHeight)
                                    ? 42
                                    : 52),
                      )))),
        ));
  }
}
