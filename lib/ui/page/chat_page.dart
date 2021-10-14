import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bang jagostar'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: CachedNetworkImageProvider(
                  'https://www.hollywoodreporter.com/wp-content/uploads/2012/05/brad_pitt_chanel_a_p.jpg'),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView.separated(
            itemCount: 20,
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 15,
              bottom: 65,
            ),
            separatorBuilder: (context, index) => Divider(
              height: 10,
              thickness: 0,
              color: Colors.transparent,
            ),
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: (index.isEven)
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Material(
                    child: InkWell(
                      onLongPress: () {
                        Clipboard.setData(ClipboardData(
                            text: 'Hallo, pesanan sesuai aplikasi ya'));

                        Fluttertoast.showToast(msg: 'Text copied');
                      },
                      borderRadius: BorderRadius.only(
                        topRight: (index.isEven)
                            ? Radius.circular(2)
                            : Radius.circular(10),
                        topLeft: (index.isEven)
                            ? Radius.circular(10)
                            : Radius.circular(2),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: Ink(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        width: Get.size.width / 1.5,
                        decoration: BoxDecoration(
                          color: (index.isEven)
                              ? Get.theme.primaryColor
                              : Colors.grey[100],
                          borderRadius: BorderRadius.only(
                            topRight: (index.isEven)
                                ? Radius.circular(2)
                                : Radius.circular(10),
                            topLeft: (index.isEven)
                                ? Radius.circular(10)
                                : Radius.circular(2),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Hallo, pesanan sesuai aplikasi ya',
                          style: TextStyle(
                            color: (index.isEven)
                                ? Colors.white
                                : Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80, right: 15),
              child: Material(
                color: Colors.grey[100],
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(20),
                  child: Ink(
                    width: 30,
                    height: 30,
                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Ink(
        height: 60,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  cursorColor: Colors.grey[600],
                  cursorWidth: 1,
                  textInputAction: TextInputAction.send,
                  decoration: InputDecoration(
                      hintText: 'Ketik sesuatu..',
                      contentPadding:
                          EdgeInsets.only(left: 20, right: 20, bottom: 10)),
                  onSubmitted: null,
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(20),
              child: Ink(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
