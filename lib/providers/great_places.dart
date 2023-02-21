import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_place_app/helpers/db_helper.dart';
import 'package:great_place_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  addPlace(String pickedTitle, File pickedImage) {
    final addItem = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      location: PlaceLocation(title: '', latitude: 0.0, longitude: 0.0),
      image: pickedImage,
    );
    _items.add(addItem);
    notifyListeners();

    DBHelper.insert('places', {
      'id': addItem.id,
      'title': addItem.title,
      'image': addItem.image.path,
    });
  }
}
