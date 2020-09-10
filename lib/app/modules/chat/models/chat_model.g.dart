// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return ChatModel(
    fUid: json['fUid'] as String,
    sUid: json['sUid'] as String,
    msg: json['msg'] as List,
  );
}

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'fUid': instance.fUid,
      'sUid': instance.sUid,
      'msg': instance.msg,
    };
