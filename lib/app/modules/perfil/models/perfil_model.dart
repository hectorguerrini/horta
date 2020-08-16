import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horta/app/shared/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'perfil_model.g.dart';

@JsonSerializable()
class PerfilModel extends BaseModel {
  String nome;
  String cpf;
  String wpp;
  String email;

  PerfilModel({this.nome, this.cpf, this.wpp, this.email});

  PerfilModel copyWith({String nome, String cpf, String wpp, String email}) {
    return PerfilModel(
        nome: nome ?? this.nome,
        cpf: cpf ?? this.cpf,
        wpp: wpp ?? this.wpp,
        email: email ?? this.email)
      ..reference = this.reference;
  }

  factory PerfilModel.fromJson(Map<String, dynamic> json) =>
      _$PerfilModelFromJson(json);

  Map<String, dynamic> toJson() => _$PerfilModelToJson(this);
}
