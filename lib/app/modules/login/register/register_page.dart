import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 70.0),
          child: Form(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/logo.png'),
                  width: size.width * 0.5,
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Escreva seu nome' : null,
                  obscureText: true,
                  onChanged: controller.setNome,
                  decoration: InputDecoration(labelText: 'Nome Completo'),
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Escreva seu email' : null,
                  obscureText: true,
                  onChanged: controller.setEmail,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  validator: (val) => val.length < 6
                      ? 'Escreva sua senha com mais de 6 caracteres'
                      : null,
                  onChanged: controller.setSenha,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                  ),
                ),
                Observer(builder: (_) {
                  return Text(
                    controller.msg,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  );
                }),
                Container(height: 10),
                RaisedButton(
                  onPressed: controller.isValid
                      ? controller.registerWithEmailAndPassword
                      : null,
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  child: Text('Criar Conta', style: TextStyle(fontSize: 16.0)),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0)),
                ),
                Container(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
