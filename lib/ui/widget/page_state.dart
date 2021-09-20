import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageState extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String text;
  final String buttonText;
  final Function onTap;

  PageState({
    @required this.iconData,
    @required this.title,
    @required this.text,
    this.buttonText = '',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Get.theme.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            iconData,
            color: Get.theme.primaryColor,
            size: 60,
          ),
        ),
        SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 6),
        SizedBox(
          width: Get.size.width / 1.2,
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20),
        (onTap == null)
            ? SizedBox.shrink()
            : FlatButton(
                onPressed: onTap,
                color: Get.theme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Get.theme.colorScheme.secondary,
                  ),
                ),
              ),
      ],
    );
  }
}
