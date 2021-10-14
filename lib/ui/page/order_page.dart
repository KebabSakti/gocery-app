import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/widget/shimmer_loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OrderPageController(),
      builder: (OrderPageController controller) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Orderan'),
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Aktif'),
                  Tab(text: 'Selesai'),
                  Tab(text: 'Batal'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  itemBuilder: (context, index) {
                    return Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: controller.routeToOrderDetail,
                        child: Ink(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      'Sedang di Proses',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.blueAccent,
                                        )),
                                  ),
                                  Text('11 Okt 06:36 PM'),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ID Order',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text('#0000000001'),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Rp 999.999.999',
                                        style: TextStyle(
                                            color: Get.theme.primaryColor),
                                      ),
                                    ],
                                  ),
                                  CachedNetworkImage(
                                    imageUrl:
                                        'https://res.cloudinary.com/vjtechsolution/image/upload/v1627400333/ayo%20mobile/cod_edit.png',
                                    height: 20,
                                    placeholder: (context, url) =>
                                        ShimmerLoader(
                                      radius: 6,
                                      width: 50,
                                      height: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Container(),
                Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
