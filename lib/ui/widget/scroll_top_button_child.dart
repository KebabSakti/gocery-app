import 'package:ayov2/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScrollTopButtonChild extends StatelessWidget {
  final Function onTap;

  const ScrollTopButtonChild({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Opacity(
        opacity: 0.8,
        child: SvgPicture.asset(
          ARROW_UP_ICON,
          width: 45,
          height: 45,
        ),
      ),
      onTap: onTap,
    );
  }
}
