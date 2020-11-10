import 'package:horta/app/enumeration/hortalicas_enum.dart';
import 'package:horta/app/enumeration/produto_disponibilidade_enum.dart';
import 'package:horta/app/enumeration/unidade_enum.dart';
import 'package:horta/app/shared/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'produtos_model.g.dart';

@JsonSerializable()
class ProdutosModel extends BaseModel {
  Hortalicas produto;
  double preco;
  Unidade unidade;
  bool disponibilidade;

  ProdutosModel(
      {this.produto, this.preco, this.unidade, this.disponibilidade = false});

  ProdutosModel copyWith(
      {Hortalicas produto,
      double preco,
      Unidade unidade,
      bool disponibilidade}) {
    return ProdutosModel(
        produto: produto ?? this.produto,
        preco: preco ?? this.preco,
        unidade: unidade ?? this.unidade,
        disponibilidade: disponibilidade ?? this.disponibilidade)
      ..reference = this.reference;
  }

  String get getIsDisponibilidade => disponibilidade
      ? ProdutoDisponibilidade.DISPONIVEL.toShortString()
      : ProdutoDisponibilidade.INDISPONIVEL.toShortString();

  factory ProdutosModel.fromJson(Map<String, dynamic> json) =>
      _$ProdutosModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProdutosModelToJson(this);
}
