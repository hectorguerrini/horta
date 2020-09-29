// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) {
  return RegisterModel(
    nome: json['nome'] as String,
    email: json['email'] as String,
    senha: json['senha'] as String,
  );
}

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'email': instance.email,
      'senha': instance.senha,
    };
