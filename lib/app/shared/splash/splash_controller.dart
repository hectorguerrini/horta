import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final AuthController _authController = Modular.get();

  _init() async {
    await _authController.init();
    if (_authController.user != null) {
      print('is Logged');
    } else {
      print('not Logged');
    }
  }

  _SplashControllerBase() {
    Future.delayed(Duration(seconds: 2)).then((value) async {
      await _init();
      Modular.to.pushReplacementNamed('/home');
    });
  }
}
