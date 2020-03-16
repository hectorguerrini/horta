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
    ..nomeHorta = json['nomeHorta'] as String
    ..minhaHistoria = json['minhaHistoria'] as String
    ..abertura = json['abertura'] as Timestamp
    ..fechamento = json['fechamento'] as Timestamp
    ..dinheiro = json['dinheiro'] as bool
    ..cartaoDebito = json['cartaoDebito'] as bool
    ..cartaoCredito = json['cartaoCredito'] as bool;
}

Map<String, dynamic> _$PerfilToJson(Perfil instance) => <String, dynamic>{
      'nome': instance.nome,
      'idade': instance.idade,
      'cpf': instance.cpf,
      'wpp': instance.wpp,
      'email': instance.email,
      'nomeHorta': instance.nomeHorta,
      'minhaHistoria': instance.minhaHistoria,
      'abertura': instance.abertura,
      'fechamento': instance.fechamento,
      'dinheiro': instance.dinheiro,
      'cartaoDebito': instance.cartaoDebito,
      'cartaoCredito': instance.cartaoCredito,
    };
