import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  final Function onTap;
  final BannerPrimaryModel item;

  SliderItem({
    @required this.onTap,
    @required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: item.bannerPrimaryImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        placeholder: (context, url) {
          return ShimmerLoader();
        },
      ),
    );
  }
}
