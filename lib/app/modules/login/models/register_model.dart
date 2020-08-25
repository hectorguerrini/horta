import 'package:json_annotation/json_annotation.dart';
part 'register_model.g.dart';


@JsonSerializable()
class RegisterModel {
  final String nome;
  final String user;
  final String senha;

  RegisterModel({this.nome, this.user, this.senha});

  copyWith({String nome, String user, String senha}){
    return RegisterModel(nome: nome ?? this.nome, user: user ?? this.user, senha: senha ?? this.senha);
  }

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
