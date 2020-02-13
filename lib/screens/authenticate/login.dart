import 'package:flutter/material.dart';
import 'package:horta/services/auth.dart';

class LoginScreenPage extends StatefulWidget { 
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenPage> {
  final _auth = AuthService();
  String usuario = '';
  String password = '';
  
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;  
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
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
                    setState(() { usuario = val; });
                  },                             
                  decoration: InputDecoration(
                    labelText: 'Usuario'
                  ),
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() { password = val; });
                  },                  
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',                    
                  ),
                  validator: (val) => val.trim().isEmpty ? 'Insira sua senha' : null,
                ),
                RaisedButton(
                  onPressed: () async {
                    print(usuario);
                  },
                  padding: EdgeInsets.all(0.0),
                  textColor: Colors.blue,
                  color: Colors.white,
                  child: Text('Entrar'),                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                      color: Colors.blue
                    )
                  ),
                )
              ],
            ),
          ),
        )
      );
  }
}


