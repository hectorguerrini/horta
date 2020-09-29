import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
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

  static GeoPoint _geoPointToJson(GeoPoint geoPoint) => geoPoint;

  static GeoPoint _geoPointFromJson(Map<String, dynamic> json) =>
      json['geoPoint'] as GeoPoint;

  factory EnderecoModel.fromJson(Map<String, dynamic> json) =>
      _$EnderecoModelFromJson(json);

  Map<String, dynamic> toJson() => _$EnderecoModelToJson(this);
  @override
  String toString() {
    return '''
      
      GeoPoint: {latitude: ${geoPoint.latitude}, longitude: ${geoPoint.longitude}}
    ''';
  }
}
