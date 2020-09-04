import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/home/repositories/home_repository.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase extends PageController with Store {
  final HomeRepository _repository = Modular.get();
  final AuthController _authController = Modular.get();

  @observable
  int _selectedPage = 0;

  @override
  int get initialPage => 0;

  @override
  bool get keepPage => true;

  _HomeControllerBase();

  @action
  login() async {
    await Modular.to.pushNamed('/login');
    _selectedPage = 0;
  }

  @computed
  bool get isLogged => _authController.user != null;

  @computed
  int get getIndexPage => _selectedPage;
  @computed
  bool get getIsAgricultor => _authController.isAgricultor;
  @action
  pageChanged(int index) {
    _selectedPage = index;
  }

  @action
  bottomTapped(int index) {
    _selectedPage = index;
    this.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
}
