// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) {
  return RegisterModel(
    nome: json['nome'] as String,
    user: json['user'] as String,
    senha: json['senha'] as String,
  );
}

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'user': instance.user,
      'senha': instance.senha,
    };
