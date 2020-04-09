// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Perfil _$PerfilFromJson(Map<String, dynamic> json) {
  return Perfil()
    ..nome = json['nome'] as String
    ..idade = json['idade'] as int
    ..cpf = json['cpf'] as String
    ..wpp = json['wpp'] as String
    ..email = json['email'] as String
    ..agricultor = json['agricultor'] as bool;
}

Map<String, dynamic> _$PerfilToJson(Perfil instance) => <String, dynamic>{
      'nome': instance.nome,
      'idade': instance.idade,
      'cpf': instance.cpf,
      'wpp': instance.wpp,
      'email': instance.email,
      'agricultor': instance.agricultor,
    };
