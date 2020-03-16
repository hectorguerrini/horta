import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'perfil.g.dart';

@JsonSerializable()

class Perfil {
  String nome;
  int idade;
  String cpf;
  String wpp;
  String email;
  String nomeHorta;
  String minhaHistoria;
  Timestamp abertura;
  Timestamp fechamento;
  bool dinheiro = false;
  bool cartaoDebito = false;
  bool cartaoCredito = false;
  
  Perfil();

/// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Perfil.fromJson(Map<String, dynamic> json) => _$PerfilFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$PerfilToJson(this);
 
}