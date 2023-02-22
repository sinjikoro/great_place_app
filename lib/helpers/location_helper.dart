const googleApiKey = '...';
const googleApiSignature = '...';

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&key=$googleApiKey&signature=$googleApiSignature';
  }
}
