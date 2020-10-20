import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/chat/repositories/chat_repository.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'chat_controller.g.dart';

class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
  final ChatRepository _repository = Modular.get();
  final AuthController _authController = Modular.get();
  final GlobalKey<DashChatState> chatViewKey = GlobalKey<DashChatState>();

  ChatUser usuario() {
    return ChatUser(
      name: getName,
      uid: getUid,
      //avatar url
    );
  }

  //PARA FINS DE TESTE:
  final sUid = 'rajFdW8hmkdL5uP4E55zNeNea863';

  @observable
  ObservableStream<List<ChatMessage>> chat;

  @observable
  List<ChatMessage> messages = List<ChatMessage>();

  @computed
  String get getName => _authController.user.displayName;

  @computed
  String get getUid => _authController.user.uid;

  @computed
  String get getAvatarUrl => _authController.user.photoURL;

  @action
  getMsg() {
    chat = _repository.getChat(sUid).asObservable();
  }

  @action
  onSend(ChatMessage message) async {
    _repository.onSend(message);
  }
}