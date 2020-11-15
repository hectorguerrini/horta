import 'package:horta/app/shared/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'perfil_model.g.dart';

@JsonSerializable()
class PerfilModel extends BaseModel {
  final String cpf;
  final String celular;
  PerfilModel({this.cpf = '', this.celular = ''});
  PerfilModel copyWith(
      {String nome, String cpf, String celular, String email}) {
    return PerfilModel(
      cpf: cpf ?? this.cpf,
      celular: celular ?? this.celular,
    )..reference = this.reference;
  }

  factory PerfilModel.fromJson(Map<String, dynamic> json) =>
      _$PerfilModelFromJson(json);

  Map<String, dynamic> toJson() => _$PerfilModelToJson(this);
}
