import 'package:json_annotation/json_annotation.dart';
part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  final String nome;
  final String email;
  final String senha;

  RegisterModel({this.nome, this.email, this.senha});

  RegisterModel copyWith({String nome, String email, String senha}) {
    return RegisterModel(
        nome: nome ?? this.nome,
        email: email ?? this.email,
        senha: senha ?? this.senha);
  }

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
