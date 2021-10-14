import 'package:ayov2/getx/controller/controller.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapPage extends GetView<MapPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.grey[700],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SizedBox.fromSize(
              size: Size(35, 35),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(
                    Icons.my_location_rounded,
                    color: Colors.grey[700],
                    size: 20,
                  ),
                  onPressed: controller.deviceLocationButton,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SlidingUpPanel(
        controller: controller.panelController,
        parallaxEnabled: false,
        parallaxOffset: 0.5,
        minHeight: 160,
        maxHeight: 380,
        header: Container(
          width: Get.size.width,
          alignment: Alignment.center,
          child: Icon(
            Icons.drag_handle_rounded,
            color: Colors.grey[400],
            size: 30,
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 130),
          child: Stack(
            children: [
              GoogleMap(
                padding: EdgeInsets.only(bottom: Get.size.height * 0.2),
                mapToolbarEnabled: false,
                rotateGesturesEnabled: false,
                tiltGesturesEnabled: false,
                zoomControlsEnabled: false,
                compassEnabled: false,
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                initialCameraPosition: controller.initialCamera(),
                onCameraMoveStarted: controller.onCameraMoveStarted,
                onCameraMove: controller.onCameraMove,
                onCameraIdle: controller.onCameraIdle,
                onMapCreated: controller.onMapCreated,
              ),
              Center(
                child: ClipOval(
                  child: Container(
                    height: 10,
                    width: 10,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
              Center(
                child: Transform.translate(
                  offset: Offset(0, -12),
                  child: Icon(
                    Icons.place_rounded,
                    color: Colors.redAccent,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        panel: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detail alamat tujuan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 80,
                width: double.infinity,
                child: Obx(() {
                  if (!controller.loading.value) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[100],
                          child: Icon(
                            Icons.place_rounded,
                            color: Colors.redAccent,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.helper
                                    .placeName(controller.address())
                                    .toUpperCase(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                controller.address.value,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: GestureDetector(
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                color: Get.theme.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: controller.routeToSearchAddressPage,
                          ),
                        ),
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerLoader(
                        height: 40,
                        width: 40,
                        radius: 20,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerLoader(
                              height: 13,
                              radius: 10,
                              width: 150,
                            ),
                            SizedBox(height: 8),
                            ShimmerLoader(
                              height: 13,
                              radius: 10,
                              width: 250,
                            ),
                            SizedBox(height: 5),
                            ShimmerLoader(
                              height: 13,
                              radius: 10,
                              width: 200,
                            ),
                            SizedBox(height: 5),
                            ShimmerLoader(
                              height: 13,
                              radius: 10,
                              width: 180,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
              TextFormField(
                autofocus: false,
                cursorColor: Colors.grey[800],
                cursorWidth: 1,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 16,
                  height: 1,
                ),
                decoration: InputDecoration(
                  labelText: 'Nama Penerima',
                  prefixIcon: Icon(Icons.account_circle_rounded),
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  labelStyle: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.normal,
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                autofocus: false,
                cursorColor: Colors.grey[800],
                cursorWidth: 1,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 16,
                  height: 1,
                ),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: 'No Hp',
                  prefixIcon: Icon(Icons.phone_rounded),
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  prefix: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(
                      '+62',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        height: 1,
                      ),
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.normal,
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                autofocus: false,
                cursorColor: Colors.grey[800],
                cursorWidth: 1,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 16,
                  height: 1,
                ),
                decoration: InputDecoration(
                  labelText: 'Catatan',
                  prefixIcon: Icon(Icons.sticky_note_2_rounded),
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  labelStyle: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.normal,
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  color: Get.theme.primaryColor,
                  disabledColor: Get.theme.colorScheme.onSecondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Lanjut',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: controller.complete,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
