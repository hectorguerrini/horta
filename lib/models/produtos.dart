import 'package:json_annotation/json_annotation.dart';

part 'produtos.g.dart';

@JsonSerializable()

class Produtos {
  String produto;
  String icon;
  int preco;
  String unidade;
  
  Produtos();

/// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Produtos.fromJson(Map<String, dynamic> json) => _$ProdutosFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ProdutosToJson(this);
 
}