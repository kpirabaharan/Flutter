// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:io' show Platform;

import '../keys/api_key.dart' as key;
import 'package:http/http.dart' as http;

const ANDROID_KEY = key.androidKey;
const IOS_KEY = key.iOSKey;

class LocationHelper {
  static String generateLocationImage(
      {required double latitude, required double longitude}) {
    if (Platform.isIOS) {
      return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x600&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$IOS_KEY';
    }
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x600&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$ANDROID_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    Uri geocodingUrl;
    if (Platform.isIOS) {
      geocodingUrl = Uri.parse(
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$IOS_KEY');
    } else {
      geocodingUrl = Uri.parse(
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$ANDROID_KEY');
    }

    final response = await http.get(geocodingUrl);

    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
