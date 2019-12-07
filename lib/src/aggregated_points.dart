import 'package:google_maps_flutter/google_maps_flutter.dart';

class AggregatedPoints {
  final LatLng location;
  final int count;
  String bitmapAssetName;

  AggregatedPoints(this.location, this.count) {
    this.bitmapAssetName = getBitmapDescriptor();
  }

  AggregatedPoints.fromMap(
      Map<String, dynamic> map, String dbLatColumn, String dbLongColumn)
      : count = map['n_marker'],
        this.location = LatLng(map['lat'], map['long']) {
    this.bitmapAssetName = getBitmapDescriptor();
  }

  String getBitmapDescriptor() {
    String bitmapDescriptor;
    if (count < 10) {
      // + 2
      bitmapDescriptor = "assets/images/m1.bmp";
    } else if (count < 25) {
      // + 10
      bitmapDescriptor = "assets/images/m2.bmp";
    } else if (count < 50) {
      // + 25
      bitmapDescriptor = "assets/images/m3.bmp";
    } else if (count < 100) {
      // + 50
      bitmapDescriptor = "assets/images/m4.bmp";
    } else if (count < 500) {
      // + 100
      bitmapDescriptor = "assets/images/m5.bmp";
    } else if (count < 1000) {
      // +500
      bitmapDescriptor = "assets/images/m6.bmp";
    } else {
      // + 1k
      bitmapDescriptor = "assets/images/m7.bmp";
    }
    return bitmapDescriptor;
  }

  getId() {
    return location.latitude.toString() +
        "_" +
        location.longitude.toString() +
        "_$count";
  }
}
