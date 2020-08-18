import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 70.0),
          child: Form(            
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Escreva seu nome' : null,
                  onChanged: controller.setNome,
                  decoration: InputDecoration(labelText: 'Nome Completo'),
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Escreva seu email' : null,
                  onChanged: controller.setUser,
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
                
                RaisedButton(
                  onPressed: () async {
                    //registro com email e senha
                  },
                  elevation: 5.0,
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text('Criar Conta', style: TextStyle(fontSize: 16.0)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                FlatButton(
                  onPressed: () {
                    
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
