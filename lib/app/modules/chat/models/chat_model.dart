import 'package:horta/app/shared/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel extends BaseModel {
  String fUid;
  String sUid;
  List msg;

  ChatModel({this.fUid, this.sUid, this.msg});

  copyWith({
    String fUid,
    String sUid,
    List msg,
  }) {
    return ChatModel(
        fUid: fUid ?? this.fUid, sUid: sUid ?? this.sUid, msg: msg ?? this.msg)
      ..reference = this.reference;
  }

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
