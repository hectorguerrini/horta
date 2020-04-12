// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Horta _$HortaFromJson(Map<String, dynamic> json) {
  return Horta()
    ..nomeHorta = json['nomeHorta'] as String
    ..minhaHistoria = json['minhaHistoria'] as String
    ..dinheiro = json['dinheiro'] as bool
    ..cartaoDebito = json['cartaoDebito'] as bool
    ..cartaoCredito = json['cartaoCredito'] as bool;
}

Map<String, dynamic> _$HortaToJson(Horta instance) => <String, dynamic>{
      'nomeHorta': instance.nomeHorta,
      'minhaHistoria': instance.minhaHistoria,
      'dinheiro': instance.dinheiro,
      'cartaoDebito': instance.cartaoDebito,
      'cartaoCredito': instance.cartaoCredito,
    };
