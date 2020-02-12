import 'package:flutter/material.dart';
import 'package:horta/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

final AuthService _auth = AuthService();

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            backgroundColor: Colors.brown,
            elevation: 0.0,
            title: Text('Faca o login')),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: RaisedButton(
                child: Text('Login anonimo'),
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print('Falha ao logar');
                  } else {
                    print('Sucesso ao logar');
                    print(result.uid);
                  }
                })));
  }
}
