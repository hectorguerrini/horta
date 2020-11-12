import 'agricultor_pagina_controller.dart';
import 'repositories/agricultor_pagina_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'agricultor_pagina_page.dart';

class AgricultorPaginaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AgricultorPaginaController()),
        Bind((i) => AgricultorPaginaRepository()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => AgricultorPaginaPage()),
      ];

  static Inject get to => Inject<AgricultorPaginaModule>.of();
}
