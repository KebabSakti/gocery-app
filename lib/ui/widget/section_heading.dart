import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionHeading extends StatelessWidget {
  final String heading;
  final VoidCallback onPressed;

  SectionHeading({
    @required this.heading,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            heading,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              // fontSize: 16,
            ),
          ),
        ),
        (onPressed == null)
            ? SizedBox.shrink()
            : GestureDetector(
                onTap: onPressed,
                child: Text(
                  'Lihat Semua',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Get.theme.primaryColor,
                    fontSize: 12,
                  ),
                ),
              ),
      ],
    );
  }
}
