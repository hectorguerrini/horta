import 'package:flutter/material.dart';
import 'package:horta/auth_controller.dart';
import 'package:horta/models/handleErrorLogin.dart';
import 'package:horta/services/auth.dart';
import 'package:provider/provider.dart';

class LoginScreenPage extends StatefulWidget {
  final Function toggleView;
  LoginScreenPage({this.toggleView});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenPage> {
  final _formKey = GlobalKey<FormState>();

  String usuario = '';
  String senha = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    return Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  TextFormField(
                    validator: (val) =>
                        val.isEmpty ? 'Escreva seu email' : null,
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
                        await authController
                            .login(usuario, senha)
                            .then((onValue) {
                          Navigator.pop(context);
                        }).catchError((onError) {
                          setState(() => error =
                              new HandleErrorLogin(onError.code).errorMessage);
                        });
                      }
                    },
                    textColor: Colors.white,
                    color: Colors.green,
                    child: Text(
                      'Entrar',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.green)),
                  ),
                  FlatButton(
                      onPressed: () {
                        widget.toggleView();
                      },
                      textColor: Colors.green,
                      child:
                          Text('Criar Conta', style: TextStyle(fontSize: 16.0)))
                ],
              ),
            ),
          ),
        ));
  }
}
