// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatController on _ChatControllerBase, Store {
  Computed<String> _$getNameComputed;

  @override
  String get getName =>
      (_$getNameComputed ??= Computed<String>(() => super.getName,
              name: '_ChatControllerBase.getName'))
          .value;
  Computed<String> _$getUidComputed;

  @override
  String get getUid =>
      (_$getUidComputed ??= Computed<String>(() => super.getUid,
              name: '_ChatControllerBase.getUid'))
          .value;
  Computed<String> _$getAvatarUrlComputed;

  @override
  String get getAvatarUrl =>
      (_$getAvatarUrlComputed ??= Computed<String>(() => super.getAvatarUrl,
              name: '_ChatControllerBase.getAvatarUrl'))
          .value;

  final _$chatAtom = Atom(name: '_ChatControllerBase.chat');

  @override
  ObservableStream<List<ChatModel>> get chat {
    _$chatAtom.reportRead();
    return super.chat;
  }

  @override
  set chat(ObservableStream<List<ChatModel>> value) {
    _$chatAtom.reportWrite(value, super.chat, () {
      super.chat = value;
    });
  }

  final _$messagesAtom = Atom(name: '_ChatControllerBase.messages');

  @override
  List<ChatMessage> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(List<ChatMessage> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  final _$onSendAsyncAction = AsyncAction('_ChatControllerBase.onSend');

  @override
  Future onSend(ChatMessage message) {
    return _$onSendAsyncAction.run(() => super.onSend(message));
  }

  final _$_ChatControllerBaseActionController =
      ActionController(name: '_ChatControllerBase');

  @override
  dynamic getMsg() {
    final _$actionInfo = _$_ChatControllerBaseActionController.startAction(
        name: '_ChatControllerBase.getMsg');
    try {
      return super.getMsg();
    } finally {
      _$_ChatControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chat: ${chat},
messages: ${messages},
getName: ${getName},
getUid: ${getUid},
getAvatarUrl: ${getAvatarUrl}
    ''';
  }
}
