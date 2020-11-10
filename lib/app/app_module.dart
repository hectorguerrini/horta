import 'package:horta/app/modules/agricultor/agricultor_module.dart';
import 'package:horta/app/modules/agricultorPagina/agricultor_pagina_page.dart';
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

import 'modules/AgricultorPagina/agricultor_pagina_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => AuthController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => SplashController())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashScreen()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/perfil', module: PerfilModule()),
        ModularRouter('/agricultor', module: AgricultorModule()),
        ModularRouter('/agricultorPagina', module: AgricultorPaginaModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
