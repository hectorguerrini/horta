import 'package:horta/app/modules/login/login_module.dart';
import 'package:horta/app/modules/perfil/perfil_module.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';
import 'package:horta/app/shared/auth/repositories/auth_reposiroty_interface.dart';
import 'package:horta/app/shared/auth/repositories/auth_repository.dart';
import 'package:horta/app/shared/splash/splash_controller.dart';
import 'package:horta/app/shared/splash/splash_screen.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:horta/app/app_widget.dart';
import 'package:horta/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => AuthController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => SplashController())
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SplashScreen()),
        Router('/home', module: HomeModule()),
        Router('/login', module: LoginModule()),
        Router('/perfil', module: PerfilModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
