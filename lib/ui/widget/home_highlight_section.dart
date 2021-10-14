import 'package:ayov2/getx/controller/controller.dart';
import 'package:flutter/material.dart';

class HomeHightligthSection extends StatelessWidget {
  final HomePageController controller;

  HomeHightligthSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Ink(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
