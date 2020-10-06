import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:horta/app/modules/chat/models/chatRoom_model.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';

class ChatRoomRepository{
  final DioForNative client;
  final CollectionReference _collectionReference =
    FirebaseFirestore.instance.collection('chatRoom');
  final AuthController _authController = Modular.get();
  ChatRoomRepository(this.client);
 
  Future<ChatRoom> getChatRoom(ChatRoom chatRoom) async {
    if(chatRoom.reference == null){
      chatRoom.reference = await _collectionReference.add(chatRoom.toJson());
      return chatRoom;
    }
    else{
      return chatRoom;
    }
  }
}
