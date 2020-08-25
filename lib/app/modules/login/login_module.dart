import 'package:horta/app/modules/login/register/register_controller.dart';
import 'package:horta/app/modules/login/register/register_page.dart';

import 'repositories/login_repository.dart';
import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginRepository(Dio())),
        Bind((i) => LoginController()),
        Bind((i) => RegisterController())
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
        Router('/cadastro', child: (_, args) => RegisterPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
