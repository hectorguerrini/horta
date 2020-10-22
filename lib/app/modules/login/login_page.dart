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
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    width: size.width * 0.5,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    validator: (val) =>
                        val.isEmpty ? 'Escreva seu email' : null,
                    onChanged: controller.setEmail,
                    decoration: InputDecoration(
                      hintText: "Usuario",
                      hintStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      fillColor:
                          Theme.of(context).primaryColor.withOpacity(0.3),
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(32)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    validator: (val) => val.length < 6
                        ? 'Escreva sua senha com mais de 6 caracteres'
                        : null,
                    onChanged: controller.setSenha,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(32)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(32)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      hintText: "Senha",
                      hintStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      fillColor:
                          Theme.of(context).primaryColor.withOpacity(0.3),
                      filled: true,
                    ),
                  ),
                ),
                Observer(builder: (_) {
                  return Text(
                    controller.msg,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  );
                }),
                RaisedButton(
                  onPressed: controller.isValid ? controller.login : null,
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Entrar',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
                Container(height: 10),
                RaisedButton(
                    onPressed: () {
                      Modular.to.pushNamed('/login/cadastro');
                    },
                    child: Text("Cadastro"),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    )),
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
