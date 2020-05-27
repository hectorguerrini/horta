// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProdutosModel _$ProdutosModelFromJson(Map<String, dynamic> json) {
  return ProdutosModel(
    produto: json['produto'] as String,
    icon: json['icon'] as String,
    preco: (json['preco'] as num)?.toDouble(),
    unidade: json['unidade'] as String,
  );
}

Map<String, dynamic> _$ProdutosModelToJson(ProdutosModel instance) =>
    <String, dynamic>{
      'produto': instance.produto,
      'icon': instance.icon,
      'preco': instance.preco,
      'unidade': instance.unidade,
    };
