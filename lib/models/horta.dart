import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'horta.g.dart';

@JsonSerializable()
class Horta {  
  String nomeHorta;
  String minhaHistoria;
  //Timestamp abertura;
  //Timestamp fechamento;
  bool dinheiro = false;
  bool cartaoDebito = false;
  bool cartaoCredito = false;  
  
  Horta();

  factory Horta.fromJson(Map<String, dynamic> json) => _$HortaFromJson(json);
  
  Map<String, dynamic> toJson() => _$HortaToJson(this);
}