import 'package:cloud_firestore/cloud_firestore.dart';

class EnderecoModel {
  final double latitude;
  final double longitude;

  EnderecoModel({this.latitude, this.longitude});

  GeoPoint toJson() => GeoPoint(this.latitude, longitude);
}
