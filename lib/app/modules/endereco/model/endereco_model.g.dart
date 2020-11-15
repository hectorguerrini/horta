// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endereco_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnderecoModel _$EnderecoModelFromJson(Map<String, dynamic> json) {
  return EnderecoModel(
    logradouro: json['logradouro'] as String,
    numero: json['numero'] as String,
    complemento: json['complemento'] as String,
    bairro: json['bairro'] as String,
    cidade: json['cidade'] as String,
    estado: json['estado'] as String,
    cep: json['cep'] as String,
    geoPoint: EnderecoModel._geoPointFromJson(json['geoPoint'] as GeoPoint),
  );
}

Map<String, dynamic> _$EnderecoModelToJson(EnderecoModel instance) =>
    <String, dynamic>{
      'logradouro': instance.logradouro,
      'numero': instance.numero,
      'complemento': instance.complemento,
      'bairro': instance.bairro,
      'cidade': instance.cidade,
      'estado': instance.estado,
      'cep': instance.cep,
      'geoPoint': EnderecoModel._geoPointToJson(instance.geoPoint),
    };
