import 'package:flutter/material.dart';
import 'package:horta/screens/listaProdutos.dart';

class MenuAgricultorScreen extends StatefulWidget {
  @override
  _MenuAgricultorScreenState createState() => _MenuAgricultorScreenState();
}

class _MenuAgricultorScreenState extends State<MenuAgricultorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Produtos"), 
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          FlatButton(
            color: Colors.red,
            onPressed: (){
              Navigator.pushNamed(context, '/listaProdutos');
            },
            child: Text("Adicionar produto"),
          )
        ],
      )
      );  
  }
}

