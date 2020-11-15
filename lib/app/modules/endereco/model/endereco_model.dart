import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:horta/app/shared/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'endereco_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EnderecoModel extends BaseModel {
  final String logradouro;
  final String numero;
  final String complemento;
  final String bairro;
  final String cidade;
  final String estado;
  final String cep;
  @JsonKey(toJson: _geoPointToJson, fromJson: _geoPointFromJson)
  final GeoPoint geoPoint;

  EnderecoModel(
      {this.logradouro,
      this.numero,
      this.complemento,
      this.bairro,
      this.cidade,
      this.estado,
      this.cep,
      this.geoPoint});

  EnderecoModel copyWith(
      {String logradouro,
      String numero,
      String complemento,
      String bairro,
      String cidade,
      String estado,
      String cep,
      GeoPoint geoPoint}) {
    return EnderecoModel(
      logradouro: logradouro ?? this.logradouro,
      numero: numero ?? this.numero,
      complemento: complemento ?? this.complemento,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
      cep: cep ?? this.cep,
      geoPoint: geoPoint ?? this.geoPoint,
    )..reference = this.reference;
  }

  static GeoPoint _geoPointToJson(GeoPoint geoPoint) => geoPoint;

  static GeoPoint _geoPointFromJson(GeoPoint geoPoint) => geoPoint;

  factory EnderecoModel.fromJson(Map<String, dynamic> json) =>
      _$EnderecoModelFromJson(json);

  Map<String, dynamic> toJson() => _$EnderecoModelToJson(this);

  String enderecoFormat() {
    return '''$logradouro $numero - $bairro, $cidade $cep''';
  }

  EnderecoModel fromPlacemarkandGeoPoint(Placemark _address, LatLng _latLng) {
    return EnderecoModel(
        logradouro: _address.thoroughfare,
        numero: _address.subThoroughfare,
        bairro: _address.subLocality,
        cidade: _address.subAdministrativeArea,
        estado: _address.administrativeArea,
        cep: _address.postalCode,
        geoPoint: GeoPoint(_latLng.latitude, _latLng.longitude))
      ..reference = this.reference;
  }

  LatLng get getLatLng {
    return LatLng(this.geoPoint.latitude, this.geoPoint.longitude);
  }

  @override
  String toString() {
    return '''   
      GeoPoint: {latitude: ${geoPoint.latitude}, longitude: ${geoPoint.longitude}}
    ''';
  }
}
