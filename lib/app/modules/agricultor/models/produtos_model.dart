import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horta/app/enumeration/produto_disponibilidade_enum.dart';
import 'package:horta/app/shared/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'produtos_model.g.dart';

@JsonSerializable()
class ProdutosModel extends BaseModel {
  String produto;
  String icon;
  double preco;
  String unidade;
  bool disponibilidade;

  ProdutosModel(
      {this.produto,
      this.icon,
      this.preco,
      this.unidade,
      this.disponibilidade});

  copyWith(
      {String produto,
      String icon,
      double preco,
      String unidade,
      bool disponibilidade}) {
    return ProdutosModel(
        produto: produto ?? this.produto,
        icon: icon ?? this.icon,
        preco: preco ?? this.preco,
        unidade: unidade ?? this.unidade,
        disponibilidade: disponibilidade ?? this.disponibilidade);
  }

  String getIsDisponibilidade() {
    return disponibilidade
        ? ProdutoDisponibilidade.DISPONIVEL.toShortString()
        : ProdutoDisponibilidade.INDISPONIVEL.toShortString();
  }

  factory ProdutosModel.fromJson(Map<String, dynamic> json) =>
      _$ProdutosModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProdutosModelToJson(this);
}
