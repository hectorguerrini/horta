import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  final String email;
  final String senha;

  LoginModel({this.email, this.senha});

  copyWith({String email, String senha}) {
    return LoginModel(email: email ?? this.email, senha: senha ?? this.senha);
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
