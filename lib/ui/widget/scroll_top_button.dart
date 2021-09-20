import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollTopButton extends StatelessWidget {
  final ScrollController scrollController;
  final String tag;

  ScrollTopButton({
    @required this.scrollController,
    @required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollTopButtonController controller =
        Get.put(ScrollTopButtonController(scrollController), tag: tag);
    return Obx(() {
      return TweenAnimationBuilder(
        curve: Curves.bounceOut,
        duration: Duration(milliseconds: 300),
        tween: Tween<double>(
          begin: 0.0,
          end: controller.endTween.value,
        ),
        child: ScrollTopButtonChild(
          onTap: controller.scrollToTop,
        ),
        builder: (context, scale, child) => Transform.scale(
          scale: scale,
          child: child,
        ),
      );
    });
  }
}
