import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_place_app/helpers/db_helper.dart';
import 'package:great_place_app/helpers/location_helper.dart';
import 'package:great_place_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Future<void> addPlace(
    String pickedTitle,
    File pickedImage,
    PlaceLocation pickedLocation,
  ) async {
    final address = await LocationHelper.getPlaceAddress(
      pickedLocation.latitude,
      pickedLocation.longitude,
    );
    final updatedLocation = PlaceLocation(
      latitude: pickedLocation.latitude,
      longitude: pickedLocation.longitude,
      title: address,
    );
    final addItem = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      location: updatedLocation,
      image: pickedImage,
    );
    _items.add(addItem);
    notifyListeners();

    DBHelper.insert('places', {
      'id': addItem.id,
      'title': addItem.title,
      'image': addItem.image.path,
      'loc_lat': addItem.location.latitude,
      'loc_lng': addItem.location.longitude,
      'address': addItem.location.title,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            location: PlaceLocation(
              latitude: item['loc_lat'],
              longitude: item['loc_lng'],
              title: item['address'],
            ),
            image: File(item['image']),
          ),
        )
        .toList();
  }
}
