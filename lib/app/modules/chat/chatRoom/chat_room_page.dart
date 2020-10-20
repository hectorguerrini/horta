import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'chat_room_controller.dart';

class ChatRoomPage extends StatefulWidget {
  final String title;
  const ChatRoomPage({Key key, this.title = "ChatRoom"}) : super(key: key);

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState
    extends ModularState<ChatRoomPage, ChatRoomController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            FlatButton(
                onPressed: () {
                  Modular.to.pushNamed('/chatRoom/chat');
                },
                child: Text("Horta ronaldo")),
          ],
        ));
  }
}
