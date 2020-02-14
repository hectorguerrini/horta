import 'package:flutter/material.dart';
import 'package:horta/services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _auth = AuthService();
  String usuario = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            FlatButton.icon(
             
              onPressed: (){
               
              },
              icon: Icon(Icons.person), 
              label: Text('Faca o login'),
            ),
          ],
          title: Text('Registro'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  onChanged: (val) {
                    setState(() {
                      usuario = val;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Usuario'),
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                  ),
                  validator: (val) =>
                      val.trim().isEmpty ? 'Insira sua senha' : null,
                ),
                RaisedButton(
                  onPressed: () async {
                    print(usuario);
                  },
                  padding: EdgeInsets.all(0.0),
                  textColor: Colors.blue,
                  color: Colors.white,
                  child: Text('Registro'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.blue)),
                ),                    
              ],
            ),
          ),
        ));
  }
}
