import 'package:horta/app/modules/perfil/meu-perfil/meu_perfil_controller.dart';
import 'package:horta/app/modules/perfil/meu-perfil/meu_perfil_page.dart';
import 'package:horta/app/modules/perfil/minha-horta/minha_horta_controller.dart';
import 'package:horta/app/modules/perfil/minha-horta/minha_horta_page.dart';
import 'package:horta/app/modules/perfil/repositories/minha_horta_repository.dart';

import 'perfil_controller.dart';
import 'repositories/perfil_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'perfil_page.dart';

class PerfilModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PerfilController()),
        Bind((i) => PerfilRepository()),
        Bind((i) => MeuPerfilController()),
        Bind((i) => MinhaHortaController()),
        Bind((i) => MinhaHortaRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => PerfilPage()),
        Router('/conta', child: (_, args) => MeuPerfilPage()),
        Router('/horta', child: (_, args) => MinhaHortaPage()),
      ];

  static Inject get to => Inject<PerfilModule>.of();
}
