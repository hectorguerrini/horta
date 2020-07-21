import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'produtos_model.g.dart';

@JsonSerializable()
class ProdutosModel {
  String produto;
  String icon;
  double preco;
  String unidade;
  bool disponibilidade;
  @JsonKey(ignore: true)
  DocumentReference reference;

  ProdutosModel(
      {this.produto,
      this.icon,
      this.preco,
      this.unidade,
      this.disponibilidade,
      this.reference});

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
        disponibilidade: disponibilidade ?? this.disponibilidade,
        reference: this.reference);
  }

  String getIsDisponibilidade() {
    return disponibilidade ? 'Disponivel' : 'Indisponivel';
  }

  factory ProdutosModel.fromJson(
          Map<String, dynamic> json, DocumentReference _reference) =>
      _$ProdutosModelFromJson(json)..reference = _reference;

  Map<String, dynamic> toJson() => _$ProdutosModelToJson(this);
}
