import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horta/app/shared/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'horta_model.g.dart';

@JsonSerializable()
class HortaModel extends BaseModel {
  final String nomeHorta;
  final String minhaHistoria;

  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeAsIs)
  final DateTime abertura;

  @JsonKey(
      fromJson: _dateTimeFromTimestamp, toJson: _dateTimeAsIs, nullable: true)
  final DateTime fechamento;
  @JsonKey(defaultValue: false)
  final bool dinheiro;
  @JsonKey(defaultValue: false)
  final bool cartaoDebito;
  @JsonKey(defaultValue: false)
  final bool cartaoCredito;

  HortaModel(
      {this.nomeHorta,
      this.minhaHistoria,
      this.abertura,
      this.fechamento,
      this.dinheiro = false,
      this.cartaoDebito = false,
      this.cartaoCredito = false});

  static Timestamp _dateTimeAsIs(DateTime dateTime) => dateTime != null
      ? Timestamp.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch)
      : null;

  static DateTime _dateTimeFromTimestamp(Timestamp timestamp) => timestamp !=
          null
      ? DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch)
      : null;
  HortaModel copyWith({
    String nomeHorta,
    String minhaHistoria,
    DateTime abertura,
    DateTime fechamento,
    bool dinheiro,
    bool cartaoDebito,
    bool cartaoCredito,
  }) {
    return HortaModel(
        nomeHorta: nomeHorta ?? this.nomeHorta,
        minhaHistoria: minhaHistoria ?? this.minhaHistoria,
        abertura: abertura ?? this.abertura,
        fechamento: fechamento ?? this.fechamento,
        dinheiro: dinheiro ?? this.dinheiro,
        cartaoDebito: cartaoDebito ?? this.cartaoDebito,
        cartaoCredito: cartaoCredito ?? this.cartaoCredito)
      ..reference = this.reference;
  }

  factory HortaModel.fromJson(Map<String, dynamic> json) =>
      _$HortaModelFromJson(json);

  Map<String, dynamic> toJson() => _$HortaModelToJson(this);
}
