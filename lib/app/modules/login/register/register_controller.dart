import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/login/models/register_model.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';
import 'package:horta/app/shared/components/toast_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:oktoast/oktoast.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final AuthController _authController = Modular.get();
  @observable
  RegisterModel registerModel;

  @action
  setNome(String value) => registerModel = registerModel.copyWith(nome: value);

  @action
  setEmail(String value) =>
      registerModel = registerModel.copyWith(email: value);

  @action
  setSenha(String value) =>
      registerModel = registerModel.copyWith(senha: value);

  @action
  registerWithEmailAndPassword() async {
    try {
      await _authController.registerWithEmail(
          registerModel.nome, registerModel.email, registerModel.senha);
      showToastWidget(ToastWidget(msg: 'Cadastrado com sucesso'));
      Modular.to.pop();
    } catch (e) {
      print(e);
    }
  }
}
