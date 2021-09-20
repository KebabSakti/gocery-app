import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeMostSearchSection extends StatelessWidget {
  final HomePageController controller;

  HomeMostSearchSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 10.0;
    var _mainAxisSpacing = 10.0;
    var _screenWidth = Get.size.width;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var _cellHeight = (150 / 2) - 1;
    var _aspectRatio = _width / _cellHeight;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SectionHeading(heading: 'Pencarian Terbanyak'),
            SizedBox(height: 15),
            SizedBox(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _crossAxisCount,
                    crossAxisSpacing: _crossAxisSpacing,
                    mainAxisSpacing: _mainAxisSpacing,
                    childAspectRatio: _aspectRatio,
                  ),
                  itemBuilder: (context, index) {
                    return Obx(() {
                      StateModel<HomePageModel> home = controller.home();

                      if (home.state == States.loading) {
                        return ShimmerLoader(radius: 15);
                      }

                      if (home.data.mostSearch.length > 0) {
                        List<SearchModel> searches = home.data.mostSearch;

                        return MostSearchItem(
                          width: _width / 3,
                          model: searches[index],
                          onTap: () {},
                        );
                      }

                      return SizedBox.shrink();
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
