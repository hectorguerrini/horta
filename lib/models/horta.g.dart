// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HortaDocument _$HortaDocumentFromJson(Map<String, dynamic> json) {
  return HortaDocument()
    ..uid = json['uid'] as String
    ..horta = json['horta'] == null
        ? null
        : Horta.fromJson(json['horta'] as Map<String, dynamic>);
}

Map<String, dynamic> _$HortaDocumentToJson(HortaDocument instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'horta': instance.horta,
    };

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