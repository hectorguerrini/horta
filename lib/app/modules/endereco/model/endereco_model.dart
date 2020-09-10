import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';

class EnderecoModel {
  final Placemark endereco;
  final GeoPoint geoPoint;

  EnderecoModel({this.endereco, this.geoPoint});

  Map<String, dynamic> toJson() =>
      {"endereco": this.endereco.toJson(), "geoPoint": this.geoPoint};

  static EnderecoModel fromJson(Map<String, dynamic> json) {
    return EnderecoModel(
        endereco: Placemark.fromMap(json['endereco'] as Map),
        geoPoint: json['geoPoint'] as GeoPoint);
  }

  @override
  String toString() {
    return '''
      Endereço: {${endereco.toString()}},
      GeoPoint: {latitude: ${geoPoint.latitude}, longitude: ${geoPoint.longitude}}
    ''';
  }
}
