import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'chat_controller.dart';

class ChatPage extends StatefulWidget {
  final String title;
  const ChatPage({Key key, this.title = "Chat"}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends ModularState<ChatPage, ChatController> {

  //PARA TESTE!

  final ChatUser user = ChatUser(
    name: "Andre",
    uid: "zk9O8TccOwVkVDkZAIfkLVpf5803", //GET UID DO CONTROLLER
    avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
  );

  final ChatUser otherUser = ChatUser(
    name: "Basta",
    uid: "JoZhxJCloFXHRLqyK6UJCPQrWU52",
  );

  // PARA TESTE !

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("chat")
            .snapshots(), //_colectionReference,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              ),
            );
          } else {
            List<DocumentSnapshot> items = snapshot.data.documents;
              var messages =
                  items.map((i) => ChatMessage.fromJson(i.data())).toList();
            return DashChat(
              user: user,
              messages: messages,
              key: controller.chatViewKey,
              onSend: controller.onSend,
              // Testar depois abaixo
              inverted: false,
              sendOnEnter: true,
              textInputAction: TextInputAction.send,
              inputDecoration:
                    InputDecoration.collapsed(hintText: "Add message here..."),
                dateFormat: DateFormat('yyyy-MMM-dd'),
                timeFormat: DateFormat('HH:mm'),
                showUserAvatar: false,
                showAvatarForEveryMessage: false,
                scrollToBottom: true,
                onPressAvatar: (ChatUser user) {
                  print("OnPressAvatar: ${user.name}");
                },
                onLongPressAvatar: (ChatUser user) {
                  print("OnLongPressAvatar: ${user.name}");
                },
                inputMaxLines: 5,
                messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
                alwaysShowSend: true,
                inputTextStyle: TextStyle(fontSize: 16.0),
                inputContainerStyle: BoxDecoration(
                  border: Border.all(width: 0.0),
                  color: Colors.white,
                ),
            );
          }
        },
      ),
    );
  }
}
