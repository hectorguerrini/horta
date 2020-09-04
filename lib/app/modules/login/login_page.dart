import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
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
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Form(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/logo.png'),
                  width: size.width * 0.50,
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Escreva seu email' : null,
                  onChanged: controller.setEmail,
                  decoration: InputDecoration(labelText: 'Usuario'),
                ),
                TextFormField(
                  validator: (val) => val.length < 6
                      ? 'Escreva sua senha com mais de 6 caracteres'
                      : null,
                  onChanged: controller.setSenha,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Senha'),
                ),
                SizedBox(height: 20.0),
                Observer(builder: (_) {
                  return Text(
                    controller.msg,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  );
                }),
                FlatButton(
                  onPressed: controller.isValid ? controller.login : null,
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text(
                    'Entrar',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.green)),
                ),
                // FlatButton(
                //     onPressed: () {
                //       widget.toggleView();
                //     },
                //     textColor: Colors.green,
                //     child:
                //         Text('Criar Conta', style: TextStyle(fontSize: 16.0))),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Botão para login com facebook
                    IconButton(
                        icon: Image.asset('assets/facebook.png'),
                        onPressed: () async {}),
                    //Botão para login com google
                    IconButton(
                        icon: Image.asset('assets/google.png'),
                        onPressed: () async {
                          controller.loginGoogle();
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
