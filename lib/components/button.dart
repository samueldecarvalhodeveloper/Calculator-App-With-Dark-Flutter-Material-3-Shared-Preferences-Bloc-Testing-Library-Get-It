import 'package:calculatorapp/infrastructure/specifications/user_interface_specifications.dart';
import 'package:calculatorapp/styles/colors/ripple_colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String _character;
  final Color _characterColor;
  final Color _backgroundColor;
  final Color _borderColor;
  final bool _isThemeDark;
  final EdgeInsetsGeometry _padding;
  final int? _flex;
  final void Function() _onTap;

  const Button(
      this._character,
      this._characterColor,
      this._backgroundColor,
      this._borderColor,
      this._isThemeDark,
      this._padding,
      this._flex,
      this._onTap,
      {super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
        flex: _flex ?? 1,
        child: Padding(
            padding: _padding,
            child: Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(28)),
                  color: _borderColor),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(28)),
                    color: _backgroundColor,
                  ),
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(28)),
                          splashColor: _isThemeDark
                              ? RippleColors.DARK_MODE.value
                              : RippleColors.LIGHT_MODE.value,
                          highlightColor: Colors.transparent,
                          onTap: _onTap,
                          child: Center(
                              child: Text(
                            _character,
                            style: TextStyle(
                                color: _characterColor,
                                fontWeight: FontWeight.w500,
                                fontSize: UserInterfaceSpecifications
                                        .isScreenHeightSmall(screenHeight)
                                    ? 16
                                    : 42),
                          ))))),
            )));
  }
}
