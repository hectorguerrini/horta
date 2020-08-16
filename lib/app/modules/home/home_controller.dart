import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/home/repositories/home_repository.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository _repository = Modular.get();
  final AuthController _authController = Modular.get();

  @observable
  bool isAgricultor = false;

  _HomeControllerBase() {
    getIsAgricultor();
  }

  @action
  getIsAgricultor() async {
    try {
      isAgricultor =
          await _repository.getIsAgricultor(_authController.user.uid);
    } catch (e) {
      print(e.toString());
    }
  }

  @computed
  bool get isLogged => _authController.user != null;
}
