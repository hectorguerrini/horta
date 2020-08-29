// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HortaModel _$HortaModelFromJson(Map<String, dynamic> json) {
  return HortaModel(
    nomeHorta: json['nomeHorta'] as String,
    minhaHistoria: json['minhaHistoria'] as String,
    abertura: HortaModel._dateTimeFromTimestamp(json['abertura'] as Timestamp),
    fechamento:
        HortaModel._dateTimeFromTimestamp(json['fechamento'] as Timestamp),
    dinheiro: json['dinheiro'] as bool ?? false,
    cartaoDebito: json['cartaoDebito'] as bool ?? false,
    cartaoCredito: json['cartaoCredito'] as bool ?? false,
  );
}

Map<String, dynamic> _$HortaModelToJson(HortaModel instance) =>
    <String, dynamic>{
      'nomeHorta': instance.nomeHorta,
      'minhaHistoria': instance.minhaHistoria,
      'abertura': HortaModel._dateTimeAsIs(instance.abertura),
      'fechamento': HortaModel._dateTimeAsIs(instance.fechamento),
      'dinheiro': instance.dinheiro,
      'cartaoDebito': instance.cartaoDebito,
      'cartaoCredito': instance.cartaoCredito,
    };
