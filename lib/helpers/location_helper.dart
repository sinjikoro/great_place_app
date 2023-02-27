import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const googleApiKey = '...';
const googleApiSignature = '...';

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&key=$googleApiKey&signature=$googleApiSignature';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$googleApiKey';
    final response = await http.get(Uri.http(url));
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
