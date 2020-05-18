// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProdutosDocument _$ProdutosDocumentFromJson(Map<String, dynamic> json) {
  return ProdutosDocument()
    ..uid = json['uid'] as String
    ..produtos = json['produtos'] == null
        ? null
        : Produtos.fromJson(json['produtos'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ProdutosDocumentToJson(ProdutosDocument instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'produtos': instance.produtos,
    };
Produtos _$ProdutosFromJson(Map<String, dynamic> json) {
  return Produtos()
    ..produto = json['produto'] as String
    ..icon = json['icon'] as String
    ..preco = json['preco'] as double
    ..unidade = json['unidade'] as String
    ..disponibilidade = json['disponibilidade'] as bool;
}

Map<String, dynamic> _$ProdutosToJson(Produtos instance) =>
    <String, dynamic>{
      'produto': instance.produto,
      'icon': instance.icon,
      'preco': instance.preco,
      'unidade': instance.unidade,
      'disponibilidade': instance.disponibilidade,
    };
