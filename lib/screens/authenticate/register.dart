import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horta/models/handleErrorRegister.dart';
import 'package:horta/services/app.dart';
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
  final _globalKey = GlobalKey<ScaffoldState>();
  String nome = '';
  String usuario = '';
  String senha = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    AppService _appService = new AppService(context: context);
    return Scaffold(
      key: _globalKey,
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
                  validator: (val) => val.isEmpty ? 'Escreva seu nome' : null,
                  onChanged: (val) {
                    setState(() {
                      nome = val;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Nome Completo'),
                ),
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
                      _appService.showLoading();
                      await _auth
                          .registerWithEmailAndPassword(nome, usuario, senha)
                          .then((onValue) async {
                            _appService.closeLoading();
                            SnackBar snack = SnackBar(
                                content: Text("Conta criada com sucesso."),
                                action: SnackBarAction(
                                    label: "Entrar",
                                    onPressed: () {
                                      widget.toggleView();
                                    }));
                            _globalKey.currentState.showSnackBar(snack);
                      }).catchError((onError) {                        
                        setState(() {
                          _appService.closeLoading();
                          error = new HandleErrorRegister(onError.code)
                              .errorMessage;
                        });
                      });
                    }
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
