// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerfilModel _$PerfilModelFromJson(Map<String, dynamic> json) {
  return PerfilModel(
    cpf: json['cpf'] as String,
    celular: json['celular'] as String,
  );
}

Map<String, dynamic> _$PerfilModelToJson(PerfilModel instance) =>
    <String, dynamic>{
      'cpf': instance.cpf,
      'celular': instance.celular,
    };
