import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPagePanelHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[100],
          ),
        ),
      ),
      child: Icon(
        Icons.drag_handle_rounded,
        color: Colors.grey[400],
        size: 30,
      ),
    );
  }
}
