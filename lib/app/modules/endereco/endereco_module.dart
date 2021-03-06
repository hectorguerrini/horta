import 'package:horta/app/modules/endereco/mapa/mapa_page.dart';

import 'mapa/mapa_controller.dart';
import 'repositories/endereco_repository.dart';
import 'endereco_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'endereco_page.dart';

class EnderecoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MapaController()),
        Bind((i) => EnderecoRepository()),
        Bind((i) => EnderecoController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => EnderecoPage()),
        ModularRouter('/mapa', child: (_, args) => MapaPage()),
      ];

  static Inject get to => Inject<EnderecoModule>.of();
}
