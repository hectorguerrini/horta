import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horta/services/auth.dart';

class NovaSenhaScreen extends StatefulWidget {
  @override
  _NovaSenhaScreenState createState() => _NovaSenhaScreenState();
}

class _NovaSenhaScreenState extends State<NovaSenhaScreen> {
  AuthService auth = new AuthService();
  String email;
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
            ),
            FlatButton(
                onPressed: () async {
                  await auth.redefinirSenha(email);
                  Navigator.pushNamed(context, '/auth');
                },
                child: Text("Enviar email de redefinição de senha."))
          ],
        ),
      ),
    );
  }
}
