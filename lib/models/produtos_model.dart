import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'produtos_model.g.dart';

@JsonSerializable()
class ProdutosModel {
  String produto;
  String icon;
  double preco;
  String unidade;

  @JsonKey(ignore: true)
  final DocumentReference reference;

  ProdutosModel(
      {this.produto, this.icon, this.preco, this.unidade, this.reference});

  factory ProdutosModel.fromJson(Map<String, dynamic> json) =>
      _$ProdutosModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProdutosModelToJson(this);
}
