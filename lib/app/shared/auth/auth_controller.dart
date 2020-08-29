import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:horta/app/shared/auth/repositories/auth_reposiroty_interface.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _repository = Modular.get();

  @observable
  FirebaseUser user;

  @action
  setUser(FirebaseUser value) => user = value;

  _AuthControllerBase() {
    _repository.getUser().then(setUser);
  }

  @action
  Future reloadUser() async {
    await _repository.getUser().then(setUser);
  }

  @action
  Future loginWithEmail(String email, String senha) async {
    user = await _repository.loginWithEmailAndPassword(email, senha);
  }

  @action
  Future loginWithGoogle() async {
    user = await _repository.loginWithGoogle();
  }

  @action
  Future registerWithEmail(String nome, String email, String senha) async {
    user = await _repository.registerWithEmailAndPassword(nome, email, senha);
  }
}
