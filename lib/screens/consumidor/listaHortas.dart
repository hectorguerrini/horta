import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:horta/models/icons_app_icons.dart'; // IconsApp.(name_icon)
class ListaHortasScreenPage extends StatefulWidget {
  @override
  _ListaHortasScreenState createState() => _ListaHortasScreenState();
}

class _ListaHortasScreenState extends State<ListaHortasScreenPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(30),
      children: <Widget>[
        Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 50),
            child: Row(
              children: <Widget>[
                Icon(Icons.people, size: 48),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Horta Minha Vida',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center),
                          Text(
                            'Bairro Santa Paula',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[800]),
                          ),
                        ],
                      )),
                )
              ],
            )),
      ],
    );
  }
}
