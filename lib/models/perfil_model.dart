import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'perfil_model.g.dart';

@JsonSerializable()
class PerfilModel {
  String nome;
  String cpf;
  String wpp;
  String email;
  @JsonKey(ignore: true)
  DocumentReference reference;

  PerfilModel({this.nome, this.cpf, this.wpp, this.email, this.reference});

  copyWith({String nome, String cpf, String wpp, String email}) {
    return PerfilModel(
        nome: nome ?? this.nome,
        cpf: cpf ?? this.cpf,
        wpp: wpp ?? this.wpp,
        email: email ?? this.email,
        reference: this.reference);
  }

  factory PerfilModel.fromJson(
          Map<String, dynamic> json, DocumentReference _reference) =>
      _$PerfilModelFromJson(json)..reference = _reference;

  Map<String, dynamic> toJson() => _$PerfilModelToJson(this);
}
