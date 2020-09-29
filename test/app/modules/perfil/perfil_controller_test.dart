import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:horta/app/app_module.dart';

import 'package:horta/app/modules/perfil/perfil_controller.dart';
import 'package:horta/app/modules/perfil/perfil_module.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';

void main() {
  initModule(AppModule());
  initModule(PerfilModule());
  AuthController authController;
  PerfilController perfilController;

  setUp(() {
    authController = Modular.get<AuthController>();
    authController.init();
    perfilController = Modular.get<PerfilController>();
  });

  group('PerfilController Test', () {
    test("First Test perfil is instanced", () {
      expect(perfilController, isInstanceOf<PerfilController>());
    });

    test("is values not nulls", () {
      expect(perfilController.getIsAgricultor, isNotNull);
    });
  });
}
