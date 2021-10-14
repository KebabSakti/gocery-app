import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailPage extends GetView<OrderDetailPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail Order'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      'Sedang di Proses',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('11 Okt 21 | 06:36 PM'),
                      SizedBox(height: 4),
                      Text('#0000000001'),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tujuan Pengiriman',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[100],
                          child: Icon(
                            Icons.location_on_rounded,
                            color: Colors.redAccent,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Julian Aryo',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '+6281254982664',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas accumsan malesuada gravida. Integer in ante leo. Vivamus orci diam, varius eget placerat ac, pretium nec est',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            (false)
                                ? SizedBox.shrink()
                                : Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[50],
                                      border: Border(
                                        left: BorderSide(
                                          color: Colors.redAccent,
                                          width: 4,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'Masuk ikut jalan aspal, di rumah ujung ke dua dari kanan',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
              height: 1,
            ),
            InkWell(
              onTap: null,
              child: Ink(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                          width: 50,
                          height: 50,
                          imageUrl:
                              'https://st4.depositphotos.com/4329009/19956/v/380/depositphotos_199564354-stock-illustration-creative-vector-illustration-default-avatar.jpg'),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mencari Kurir..'),
                          SizedBox(height: 4),
                          ProductDeliveryType(
                            name: 'PENGIRIMAN LANGSUNG',
                            color: Colors.redAccent,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey[300],
              height: 1,
            ),
            Ink(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        imageUrl:
                            'https://www.hollywoodreporter.com/wp-content/uploads/2012/05/brad_pitt_chanel_a_p.jpg'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bang Jagostar',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        ProductDeliveryType(
                          name: 'PENGIRIMAN TERJADWAL',
                          color: Get.theme.colorScheme.primaryVariant,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: controller.routeToChatPage,
                    borderRadius: BorderRadius.circular(30),
                    child: Ink(
                      width: 38,
                      height: 38,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.sms_rounded,
                                color: Get.theme.primaryColor,
                                size: 30,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(30),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 6),
                  InkWell(
                    onTap: controller.routeToTrackingPage,
                    borderRadius: BorderRadius.circular(30),
                    child: Ink(
                      width: 38,
                      height: 38,
                      child: Center(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.explore_rounded,
                                color: Colors.blueAccent,
                                size: 30,
                              ),
                            ),
                            // Align(
                            //   alignment: Alignment.topRight,
                            //   child: Container(
                            //     width: 15,
                            //     height: 15,
                            //     decoration: BoxDecoration(
                            //       color: Colors.red,
                            //       borderRadius: BorderRadius.circular(30),
                            //       border:
                            //           Border.all(color: Colors.white, width: 2),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     Text(
                  //       '24 km',
                  //       style: TextStyle(
                  //         fontSize: 12,
                  //       ),
                  //     ),
                  //     Text(
                  //       '10 menit',
                  //       style: TextStyle(
                  //         fontSize: 12,
                  //       ),
                  //     ),
                  //     SizedBox(height: 4),
                  //     Text(
                  //       'Rp 10.000',
                  //       style: TextStyle(
                  //         fontSize: 12,
                  //         color: Get.theme.primaryColor,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[100],
              height: 8,
              thickness: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Text(
                    'Pesanan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  itemBuilder: (context, index) {
                    return Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {},
                        child: Ink(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Wortel impor malaysia $index',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 6),
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'Rp 30.000',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '  ( 3 kg )',
                                            style: TextStyle(
                                              color: Colors.grey[400],
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Ayamnya di potong 12',
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text('x 3')
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Divider(
                  color: Colors.grey[300],
                  height: 1,
                ),
                ExpandablePanel(
                  header: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Text(
                      'Tampilkan Semua',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  expanded: ListView.separated(
                    shrinkWrap: true,
                    itemCount: 10,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      color: Colors.grey[300],
                    ),
                    itemBuilder: (context, index) {
                      if (index < 2) {
                        return SizedBox.shrink();
                      }

                      return Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {},
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Wortel impor malaysia $index',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 6),
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Rp 30.000',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '  ( 3 kg )',
                                              style: TextStyle(
                                                color: Colors.grey[400],
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Ayamnya di potong 12',
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text('x 3')
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey[100],
              height: 8,
              thickness: 8,
            ),
            InkWell(
              onTap: () {},
              child: Ink(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cash On Delivery',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  'Bayar di rumah ketika barang sampai',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        CachedNetworkImage(
                          imageUrl:
                              'https://res.cloudinary.com/vjtechsolution/image/upload/v1627400333/ayo%20mobile/cod_edit.png',
                          height: 30,
                          placeholder: (context, url) =>
                              ShimmerLoader(radius: 6, width: 50, height: 30),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey[100],
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rincian Biaya',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Belanja',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(Utility().currency('100000')),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ongkos Kirim',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        Utility().currency('12000'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Biaya Admin',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        Utility().currency('4500'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Potongan Voucher',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '- ' + Utility().currency('0'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Poin Terpakai',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '- ' + Utility().currency('1000'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(height: 1),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Bayar',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        Utility().currency('100000'),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: FlatButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  color: Colors.redAccent,
                  child: Text('Batalkan Order'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
