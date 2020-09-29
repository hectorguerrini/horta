import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class BaseModel {
  @JsonKey(ignore: true)
  DocumentReference reference;
}
