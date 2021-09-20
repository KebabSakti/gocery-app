import 'package:ayov2/getx/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailQtySection extends StatelessWidget {
  final ProductDetailPageControlller controller;
  final Function onTap;

  ProductDetailQtySection({
    @required this.controller,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Get.theme.colorScheme.background,
      child: Ink(
        height: 56,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Ink(
                color: Colors.green,
                child: InkWell(
                  onTap: onTap,
                  child: Center(
                    child: Text(
                      'Beli Langsung',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Ink(
                      child: InkWell(
                        onTap: controller.minus,
                        child: Center(
                          child: Icon(
                            Icons.remove_rounded,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller.qtyField,
                      cursorColor: Colors.grey[600],
                      cursorWidth: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Ink(
                      child: InkWell(
                        onTap: controller.plus,
                        child: Center(
                          child: Icon(
                            Icons.add_rounded,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
