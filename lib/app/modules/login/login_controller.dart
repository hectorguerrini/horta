import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

import 'models/login_model.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthController _authController = Modular.get();

  @observable
  String msg = '';

  @observable
  LoginModel loginModel;

  _LoginControllerBase() {
    loginModel = new LoginModel(email: '', senha: '');
  }

  @action
  setEmail(String value) => loginModel = loginModel.copyWith(email: value);

  @action
  setSenha(String value) => loginModel = loginModel.copyWith(senha: value);

  @action
  login() async {
    try {
      await _authController.loginWithEmail(loginModel.email, loginModel.senha);
      Modular.to.pushReplacementNamed('/home');
    } on PlatformException catch (e) {
      switch (e.code) {
        case "ERROR_INVALID_EMAIL":
          msg = "Seu email está invalido. (exemplo@email.com)";
          print(msg);
          break;
        case "ERROR_WRONG_PASSWORD":
          msg = "Sua senha está incorreta. Tente novamente";
          print(msg);
          break;
        case "ERROR_USER_NOT_FOUND":
          msg =
              "Email não cadastrado. Insira um email cadastrado ou se registre.";
          print(msg);
          break;
        default:
          msg = "Erro de conexão.";
          print(msg);
          break;
      }
    }
  }

  @action
  loginGoogle() async {
    try {
      await _authController.loginWithGoogle();
      Modular.to.pop();
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  @computed
  bool get isValid =>
      loginModel.email.isNotEmpty &&
      loginModel.senha.isNotEmpty &&
      loginModel.senha.length >= 6;
}
