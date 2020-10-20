import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/perfil/models/horta_model.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(
            builder: (_) {
              if (controller.listaHortas.hasError) {
                return Center(
                    child: RaisedButton(
                        onPressed: controller.getHortas,
                        child: Text("Reload")));
              }
              if (controller.listaHortas.data == null) {
                return Center(child: CircularProgressIndicator());
              }

              List<HortaModel> lista = controller.listaHortas.data;

              if (lista.length == 0) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                      child: Text(
                    "Nenhuma Horta Encontrada",
                    style: TextStyle(color: Colors.black54),
                  )),
                );
              }

              return Expanded(
                  child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  HortaModel hortas = lista[index];
                  return ListTile(
                    title: Text(hortas.nomeHorta),
                    subtitle: Text(hortas.minhaHistoria),
                    onTap: () {},
                  );
                },
              ));
            },
          ),
        ));
  }
}
