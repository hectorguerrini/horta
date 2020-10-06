import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';

class ChatRepository{
  final DioForNative client;
  final CollectionReference _collectionReference =
    FirebaseFirestore.instance.collection('chat');
  final AuthController _authController = Modular.get();
  ChatRepository(this.client);
 

  Stream<List<ChatMessage>> getChat() {
    return _collectionReference
        .doc(_authController.user.uid)
        .collection('chat')
        .snapshots()
        .map((event) => event.docs
            .map((e) => ChatMessage.fromJson(e.data()))
            .toList());
  }

  void onSend(ChatMessage message) async {
    print(message.toJson());
    var documentReference = FirebaseFirestore.instance
        .collection('chat')
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(documentReference, message.toJson());
    });
  }

}
