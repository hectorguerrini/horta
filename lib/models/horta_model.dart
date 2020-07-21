import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'horta_model.g.dart';

@JsonSerializable()
class HortaModel {
  String nomeHorta;
  String minhaHistoria;

  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeAsIs)
  DateTime abertura;

  @JsonKey(
      fromJson: _dateTimeFromTimestamp, toJson: _dateTimeAsIs, nullable: true)
  DateTime fechamento;

  bool dinheiro;
  bool cartaoDebito;
  bool cartaoCredito;

  @JsonKey(ignore: true)
  DocumentReference reference;

  HortaModel(
      {this.nomeHorta,
      this.minhaHistoria,
      this.abertura,
      this.fechamento,
      this.dinheiro,
      this.cartaoDebito,
      this.cartaoCredito,
      this.reference});

  copyWith({
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
        cartaoCredito: cartaoCredito ?? this.cartaoCredito,
        reference: this.reference);
  }

  factory HortaModel.fromJson(
          Map<String, dynamic> json, DocumentReference _reference) =>
      _$HortaModelFromJson(json)..reference = _reference;

  Map<String, dynamic> toJson() => _$HortaModelToJson(this);

  static Timestamp _dateTimeAsIs(DateTime dateTime) => dateTime != null
      ? Timestamp.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch)
      : null;

  static DateTime _dateTimeFromTimestamp(Timestamp timestamp) => timestamp !=
          null
      ? DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch)
      : null;
}
