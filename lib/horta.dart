import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HortaScreenPage extends StatefulWidget {
  @override
  _HortaScreenState createState() => _HortaScreenState();
}

class _HortaScreenState extends State<HortaScreenPage> {
  final nome = TextEditingController(text: '');
  
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Titulo')),
        body: Column(
          children: <Widget>[
            Container(
                child: const Image(
              image: NetworkImage(
                  'https://thenypost.files.wordpress.com/2019/12/cat.jpg?quality=80&strip=all'),
            )),

            Divider(),

            Container(
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const SizedBox(height: 30),
                  const RaisedButton(
                    onPressed: null,
                    child:
                        Text('Enviar Mensagem', style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 30),
                  const RaisedButton(
                    child: Text(
                      'Ligar',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: null,
                  ),
                ],
              ),
            ),

            Divider(),
            TextField(
              style: TextStyle(fontSize: 18),  
              decoration: InputDecoration(
                labelText: 'Conheça o agricultor',
              ),
              controller: nome,
              keyboardType: TextInputType.text,
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(30),
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 50),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.tram, size: 48),
                          Expanded(
                            child: Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Cenoura',
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center),
                                Text(
                                  'Disponivel',
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
                          Icon(Icons.tram, size: 48),
                          Expanded(
                            child: Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Cenoura',
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center),
                                Text(
                                  'Disponivel',
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
                          Icon(Icons.tram, size: 48),
                          Expanded(
                            child: Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Cenoura',
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center),
                                Text(
                                  'Disponivel',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[800]),
                                ),
                              ],
                            )),
                          )
                        ],
                      )),
                ],
              ),
            )
          ],
        ));
  }
}
