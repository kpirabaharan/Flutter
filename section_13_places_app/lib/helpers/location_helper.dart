import '../keys/api_key.dart' as key;

// ignore: non_constant_identifier_names
final GOOGLE_API_KEY = key.key;

class LocationHelper {
  static String generateLocationImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
