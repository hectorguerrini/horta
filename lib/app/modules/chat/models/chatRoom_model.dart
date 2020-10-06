import 'package:horta/app/shared/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chatRoom_model.g.dart';

@JsonSerializable()
class ChatRoom extends BaseModel {
  final String fUid;
  final String sUid;
  final DateTime createAt;

  ChatRoom({this.fUid, this.sUid, this.createAt});

  copyWith({String fUid, String sUid, DateTime createAt}) {
    return ChatRoom(
      fUid: fUid ?? this.fUid,
      sUid: sUid ?? this.sUid,
      createAt: createAt ?? this.createAt,
    )..reference = this.reference;
  }

  factory ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomToJson(this);
}
