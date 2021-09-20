import 'dart:convert';

import 'package:ayov2/model/model.dart';
import 'package:ayov2/repo/repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

List<PlacesModel> _parsedPlaces(dynamic data) {
  var parsedData = jsonDecode(data);

  if (!parsedData['success']) throw Exception(parsedData['message']);

  List<PlacesModel> places = List<PlacesModel>.from(
    parsedData['data'].map(
      (item) => PlacesModel.fromJson(item),
    ),
  );

  return places;
}

class PlacesData {
  final PlacesRepo _placesRepo = PlacesRepo();

  Future<List<PlacesModel>> index({String keyword}) async {
    var response = await _placesRepo.index(keyword: keyword);

    return compute(_parsedPlaces, response.data);
  }

  Future store({@required List<PlacesModel> places}) async {
    await _placesRepo.store(places: places);
  }
}
