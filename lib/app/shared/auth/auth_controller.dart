import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:horta/app/shared/auth/repositories/auth_reposiroty_interface.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _repository = Modular.get();

  @observable
  User user;

  @observable
  bool isAgricultor = false;

  _AuthControllerBase();

  @action
  Future init() async {
    user = _repository.getUser();
    await getIsAgricultor();
  }

  @action
  Future reloadUser() async {
    user = _repository.getUser();
  }

  @action
  Future loginWithEmail(String email, String senha) async {
    user = await _repository.loginWithEmailAndPassword(email, senha);
    await getIsAgricultor();
  }

  @action
  Future loginWithGoogle() async {
    user = await _repository.loginWithGoogle();
    await getIsAgricultor();
  }

  @action
  Future registerWithEmail(String nome, String email, String senha) async {
    user = await _repository.registerWithEmailAndPassword(nome, email, senha);
  }

  @action
  Future getIsAgricultor() async {
    try {
      if (user != null)
        isAgricultor = await _repository.getIsAgricultor(user.uid);
    } catch (e) {
      print(e.toString());
    }
  }


}
