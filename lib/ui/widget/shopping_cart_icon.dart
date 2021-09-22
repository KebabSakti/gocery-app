import 'package:ayov2/const/const.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';

class ShoppingCartIcon extends StatelessWidget {
  final int value;
  final Function onPressed;

  ShoppingCartIcon({
    @required this.value,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButtonWithDot(
      Icon(
        Ayo.shopping,
        size: 24,
      ),
      value: value,
      onPressed: onPressed,
    );
  }
}
