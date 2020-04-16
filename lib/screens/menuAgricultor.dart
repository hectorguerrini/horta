import 'package:flutter/material.dart';

class MenuAgricultorScreen extends StatefulWidget {
  @override
  _MenuAgricultorScreenState createState() => _MenuAgricultorScreenState();
}

class _MenuAgricultorScreenState extends State<MenuAgricultorScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Agricultor"), 
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          RaisedButton(
            textTheme: ButtonTextTheme.primary,
            padding: EdgeInsets.all(10),
            color: Colors.blue,
            shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/listaProdutos');
            },
            child: Text("Adicionar produto",
            textScaleFactor: 1.8,
              ),
          ),

    
            

        ],
      ),
      
      );  
  }
}

