import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LocalizacaoScreenPage extends StatefulWidget {
  @override
  _LocalizacaoScreenState createState() => _LocalizacaoScreenState();
}

class _LocalizacaoScreenState extends State<LocalizacaoScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.access_alarm)),
          IconButton(onPressed: () {}, icon: Icon(Icons.access_alarm))
        ],
      ),
      body: ListView(
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
                            Text('Recanto Orgânico',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center),
                            Text(
                              'Bairro Jardins',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[800]),
                            ),
                          ],
                        )),
                  )
                ],
              )),
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
                            Text('Recanto Orgânico',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center),
                            Text(
                              'Bairro Jardins',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[800]),
                            ),
                          ],
                        )),
                  )
                ],
              )),
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
                            Text('Recanto Orgânico',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center),
                            Text(
                              'Bairro Jardins',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[800]),
                            ),
                          ],
                        )),
                  )
                ],
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 50),
              child: Row(
                children: <Widget>[
                  Icon(Icons.people, size: 48),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Horta do Seu Elias',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center),
                            Text(
                              'Bairro das Araucárias',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[800]),
                            ),
                          ],
                        )),
                  )
                ],
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 50),
              child: Row(
                children: <Widget>[
                  Icon(Icons.people, size: 48),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Terras de Tereza',
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
          Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 50),
              child: Row(children: <Widget>[
                Icon(Icons.people, size: 48),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 20),
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
                        )))
              ])),
        ],
      ),
    );
  }
}
