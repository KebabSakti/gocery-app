import 'dart:async';

import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapPageController extends GetxController {
  GoogleMapController _mapController;
  CameraPosition _cameraPosition;

  final Helper helper = Get.find();

  final PlacesCore _placesCore = PlacesCore();
  final PanelController panelController = PanelController();
  final Completer<GoogleMapController> _completer = Completer();

  final RxBool loading = true.obs;
  final RxString address = ''.obs;

  LatLng _myLocation =
      LatLng(-0.49732531314209866, 117.14187383609166); //Samarinda

  void onCameraMoveStarted() {
    if (!loading()) {
      loading(true);
      panelController.close();
    }
  }

  void onCameraMove(CameraPosition cameraPosition) {
    _cameraPosition = cameraPosition;
  }

  void onCameraIdle() async {
    if (_cameraPosition != null) {
      try {
        double _latitude = _cameraPosition.target.latitude;
        double _longitude = _cameraPosition.target.longitude;

        await _placesCore
            .addressFromLocationOffline(_latitude, _longitude)
            .then((results) {
          address(_formatPlaceMarks(results));

          if (loading()) {
            loading(false);
            panelController.open();
          }
        });
      } catch (e) {
        print(e);
        loading(false);
      }
    }
  }

  void onMapCreated(GoogleMapController controller) async {
    _completer.complete(controller);

    _mapController = await _completer.future;

    _deviceLocation();
  }

  void _deviceLocation() async {
    Position _currentPosition = await Geolocator.getCurrentPosition();

    LatLng _newPosition = LatLng(
      _currentPosition.latitude,
      _currentPosition.longitude,
    );

    CameraPosition _cameraPosition = CameraPosition(
      target: _newPosition,
      zoom: 16,
    );

    _mapController
        ?.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));

    _myLocation = _newPosition;
  }

  void deviceLocationButton() {
    _deviceLocation();
  }

  CameraPosition initialCamera() {
    return CameraPosition(target: _myLocation, zoom: 12.0);
  }

  String placeName(String value) {
    return value.substring(0, value.indexOf(','));
  }

  String _formatPlaceMarks(List<Placemark> placemarks) {
    String _formattedAddress = placemarks[0].street +
        ', ' +
        placemarks[0].subLocality +
        ', ' +
        placemarks[0].locality +
        ', ' +
        placemarks[0].subAdministrativeArea +
        ', ' +
        placemarks[0].administrativeArea +
        ', ' +
        placemarks[0].postalCode +
        ', ' +
        placemarks[0].country;

    return _formattedAddress;
  }

  void routeToSearchAddressPage() {
    Get.toNamed(DELIVERY_DETAIL_PAGE);
  }

  void complete() {
    Get.back(result: '');
  }

  @override
  void onClose() {
    _mapController.dispose();
    super.onClose();
  }
}
