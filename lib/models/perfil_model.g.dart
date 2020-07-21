// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerfilModel _$PerfilModelFromJson(Map<String, dynamic> json) {
  return PerfilModel(
    nome: json['nome'] as String,
    cpf: json['cpf'] as String,
    wpp: json['wpp'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$PerfilModelToJson(PerfilModel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'cpf': instance.cpf,
      'wpp': instance.wpp,
      'email': instance.email,
    };
