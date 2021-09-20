import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItemAlt extends StatelessWidget {
  final CategoryModel category;
  final Function onTap;

  CategoryItemAlt({
    @required this.category,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: Colors.white,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Ink(
                width: 50,
                height: 50,
                child: SvgPicture.network(
                  category.categoryImage,
                  width: 50,
                  height: 50,
                  placeholderBuilder: (context) => ShimmerLoader(
                    width: 50,
                    height: 50,
                    radius: 50,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.categoryName,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      category.categoryDescription,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
