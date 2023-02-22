import 'dart:io';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String title;

  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    this.title = '',
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
