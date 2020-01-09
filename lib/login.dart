import 'package:flutter/material.dart';

class LoginScreenPage extends StatefulWidget { 
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenPage> {
  
  final usuarioCtrl = TextEditingController();
  final pwCtrl = TextEditingController();
  String usuario = '';
  
  void goMain() {
    Navigator.pushNamed(
      context,
      '/'
    );
  }
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
                Image(
                  image: AssetImage('assets/logo2.png'),
                  width: size.width * 0.50,                  
                ),
                TextField(                
                  controller: usuarioCtrl,
                  decoration: InputDecoration(
                    labelText: 'Usuario'
                  ),
                ),
                TextFormField(
                  controller: pwCtrl,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',                    
                  ),
                  validator: (val) => val.trim().isEmpty ? 'Insira sua senha' : null,
                ),
                RaisedButton(
                  onPressed: goMain,
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


