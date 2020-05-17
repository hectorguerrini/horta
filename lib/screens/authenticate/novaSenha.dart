import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horta/models/handleErrorRedefinirSenha.dart';
import 'package:horta/services/auth.dart';

class NovaSenhaScreen extends StatefulWidget {
  @override
  _NovaSenhaScreenState createState() => _NovaSenhaScreenState();
}

class _NovaSenhaScreenState extends State<NovaSenhaScreen> {
  AuthService auth = new AuthService();
  String email;
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Esqueci minha senha"),
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(66),
          children: <Widget>[
            TextFormField(
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
              decoration: InputDecoration(labelText: 'Email'),
              validator: (val) => val.isEmpty ? 'Insira seu email' : null,
            ),
            SizedBox(height: 20.0),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
            Container(height: 30),
            RaisedButton(
                padding: EdgeInsets.all(20),
                onPressed: () async {
                  email == null
                      ? print("erro")
                      : await auth.redefinirSenha(email).then((onValue) async {
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  title: Text(
                                      "Redefinição de senha bem sucedida."),
                                  content: Text(
                                      "Verifique seu e-mail e acesse o link para redefinir sua senha."),
                                );
                              });
                          Navigator.pop(context);
                        }).catchError((onError) {
                          setState(() => error =
                              new HandleErrorRedefinirSenha(onError.code)
                                  .errorMessage);
                        });
                },
                child: Text("Enviar email de redefinição de senha."))
          ],
        ),
      ),
    );
  }
}
