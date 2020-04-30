// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Produtos _$ProdutosFromJson(Map<String, dynamic> json) {
  return Produtos(
    uid: json['uid'] as String,
  )
    ..produto = json['produto'] as String
    ..icon = json['icon'] as String
    ..preco = json['preco'] as int
    ..unidade = json['unidade'] as String;
}

Map<String, dynamic> _$ProdutosToJson(Produtos instance) => <String, dynamic>{
      'uid': instance.uid,
      'produto': instance.produto,
      'icon': instance.icon,
      'preco': instance.preco,
      'unidade': instance.unidade,
    };
