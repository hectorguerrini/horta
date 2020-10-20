import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';

class ChatRepository {
  final DioForNative client;
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('chatRoom');
  final AuthController _authController = Modular.get();
  ChatRepository(this.client);

  Stream<List<ChatMessage>> getChat() {
    return _collectionReference
        .doc(_authController.user.uid)
        .collection('messages')
        .snapshots()
        .map((event) =>
            event.docs.map((e) => ChatMessage.fromJson(e.data())).toList());
  }

  void onSend(ChatMessage message) async {
    print(message.toJson());
    var documentReference = _collectionReference
        .doc(_authController.user.uid)
        .collection('messages')
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(documentReference, message.toJson());
    });
  }
}
