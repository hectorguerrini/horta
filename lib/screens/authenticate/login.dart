import 'package:flutter/material.dart';
import 'package:horta/services/auth.dart';

class LoginScreenPage extends StatefulWidget {
  final Function toggleView;
  LoginScreenPage({this.toggleView});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenPage> {
  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String usuario = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text('Login'), actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('Cadastre-se'),
          ),
        ]),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            
            
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Escreva seu email' : null,
                  onChanged: (val) {
                    setState(() {
                      usuario = val;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Usuario'),
                ),
                TextFormField(
                  validator: (val) => val.length < 6
                      ? 'Escreva sua senha com mais de 6 caracteres'
                      : null,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                  ),
              
                ),
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.loginWithEmailAndPassword(usuario, password);
                      if (result == null) {
                        setState(() => error = 'Nao deu pra logar');
                      }
                  }},
                  padding: EdgeInsets.all(0.0),
                  textColor: Colors.blue,
                  color: Colors.white,
                  child: Text('Entrar'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.blue)),
                ),

                SizedBox(height: 20.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),

                RaisedButton(
                    padding: EdgeInsets.all(0.0),
                    textColor: Colors.blue,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.blue)),
                    child: Text('Login anonimo'),
                    onPressed: () async {
                      dynamic result = await _auth.signInAnon();
                      if (result == null) {
                        print('Falha ao logar');
                      } else {
                        print('Sucesso ao logar');
                        print(result.uid);
                      }
                    }),
              ],
            ),
          ),
        ));
  }
}
