// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatRoom_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) {
  return ChatRoom(
    fUid: json['fUid'] as String,
    sUid: json['sUid'] as String,
    createAt: json['createAt'] == null
        ? null
        : DateTime.parse(json['createAt'] as String),
  );
}

Map<String, dynamic> _$ChatRoomToJson(ChatRoom instance) => <String, dynamic>{
      'fUid': instance.fUid,
      'sUid': instance.sUid,
      'createAt': instance.createAt?.toIso8601String(),
    };
