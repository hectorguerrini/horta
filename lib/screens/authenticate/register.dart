import 'package:flutter/material.dart';
import 'package:horta/models/handleErrorRegister.dart';
import 'package:horta/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String usuario = '';
  String senha = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 70.0),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Escreva seu email' : null,
                  onChanged: (val) {
                    setState(() {
                      usuario = val;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  validator: (val) => val.length < 6
                      ? 'Escreva sua senha com mais de 6 caracteres'
                      : null,
                  onChanged: (val) {
                    setState(() {
                      senha = val;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                  ),
                ),                
                SizedBox(height: 20.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      await _auth.registerWithEmailAndPassword(usuario, senha)
                        .then((onValue) {

                        }).catchError((onError){
                          setState(() {
                            error = new HandleErrorRegister(onError.code).errorMessage;  
                          });                          
                        });                      
                    }
                  },                  
                  elevation: 5.0,
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text('Criar Conta', style: TextStyle(fontSize: 16.0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)                    
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    widget.toggleView();
                  },
                  child: Text('Login', style: TextStyle(fontSize: 16.0)),
                  textColor: Colors.green,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
