import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:horta/app/modules/chat/models/chat_model.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';

class ChatRepository{
  final DioForNative client;
  final CollectionReference _collectionReference =
    FirebaseFirestore.instance.collection('chat');
  final AuthController _authController = Modular.get();
  ChatRepository(this.client);
 

  Stream<List<ChatModel>> getChat() {
    return _collectionReference
        .doc(_authController.user.uid)
        .collection('chat')
        .snapshots()
        .map((event) => event.docs
            .map((e) => ChatModel.fromJson(e.data())..reference = e.reference)
            .toList());
  }

  
}
