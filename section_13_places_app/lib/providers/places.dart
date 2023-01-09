import 'dart:io';

import 'package:flutter/material.dart';

import '../models/place.dart' as place;
import '../helpers/db_helper.dart';
import '../helpers/location_helper.dart';

class Places with ChangeNotifier {
  List<place.Place> _items = [];

  List<place.Place> get items {
    return [..._items];
  }

  Future<void> addPlace(
      String pickedTitle, File pickedImage, place.Location location) async {
    final address = await LocationHelper.getPlaceAddress(
        location.latitude, location.longitude);

    final updatedLocation = place.Location(
        latitude: location.latitude,
        longitude: location.longitude,
        address: address);

    final newPlace = place.Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedTitle,
      location: updatedLocation,
    );
    _items.add(newPlace);
    notifyListeners();

    DBHelper.insert(
      'user_places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
        'loc_lat': newPlace.location!.latitude,
        'loc_lng': newPlace.location!.longitude,
        'address': newPlace.location!.address,
      },
    );
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList.map((item) {
      return place.Place(
        id: item['id'],
        title: item['title'],
        image: File(item['image']),
        location: place.Location(
          latitude: item['loc_lat'] as double,
          longitude: item['loc_lng'] as double,
          address: item['address'] as String,
        ),
      );
    }).toList();
    notifyListeners();
  }
}
