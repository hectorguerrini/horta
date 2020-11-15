import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';

class ChatRepository {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('chatRoom');
  final AuthController _authController = Modular.get();
  String sUid;

  ChatRepository(String sUid) {
    this.sUid = sUid;
  }

  Stream<List<ChatMessage>> getChat(String sUid) {
    return _collectionReference
        .doc(_authController.user.uid)
        .collection(sUid)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => ChatMessage.fromJson(e.data())).toList());
  }

  void onSend(ChatMessage message) async {
    print(message.toJson());

    var documentReference = _collectionReference
        .doc(_authController.user.uid)
        .collection(sUid)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(documentReference, message.toJson());
    });
  }
}
