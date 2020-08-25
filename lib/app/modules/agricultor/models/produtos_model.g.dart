// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProdutosModel _$ProdutosModelFromJson(Map<String, dynamic> json) {
  return ProdutosModel(
    produto: _$enumDecodeNullable(_$HortalicasEnumMap, json['produto']),
    preco: (json['preco'] as num)?.toDouble(),
    unidade: _$enumDecodeNullable(_$UnidadeEnumMap, json['unidade']),
    disponibilidade: json['disponibilidade'] as bool,
  );
}

Map<String, dynamic> _$ProdutosModelToJson(ProdutosModel instance) =>
    <String, dynamic>{
      'produto': _$HortalicasEnumMap[instance.produto],
      'preco': instance.preco,
      'unidade': _$UnidadeEnumMap[instance.unidade],
      'disponibilidade': instance.disponibilidade,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$HortalicasEnumMap = {
  Hortalicas.ALFACE: 'ALFACE',
  Hortalicas.BATATA: 'BATATA',
  Hortalicas.BETERRABA: 'BETERRABA',
  Hortalicas.BROCOLIS: 'BROCOLIS',
  Hortalicas.CENOURA: 'CENOURA',
  Hortalicas.COUVE_FLOR: 'COUVE_FLOR',
  Hortalicas.GENGIBRE: 'GENGIBRE',
  Hortalicas.TOMATE: 'TOMATE',
  Hortalicas.SALSINHA: 'SALSINHA',
};

const _$UnidadeEnumMap = {
  Unidade.KG: 'KG',
  Unidade.UNIDADE: 'UNIDADE',
  Unidade.DUZIA: 'DUZIA',
};
