// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Produtos _$ProdutosFromJson(Map<String, dynamic> json) {
  return Produtos()
    ..produto = json['produto'] as String
    ..icon = json['icon'] as String
    ..preco = json['preco'] as String
    ..unidade = json['unidade'] as String;
}

Map<String, dynamic> _$ProdutosToJson(Produtos instance) => <String, dynamic>{
      'produto': instance.produto,
      'icon': instance.icon,
      'preco': instance.preco,
      'unidade': instance.unidade,
    };
