import 'package:horta/app/modules/endereco/mapa/mapa_page.dart';

import 'mapa/mapa_controller.dart';
import 'repositories/endereco_repository.dart';
import 'endereco_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'endereco_page.dart';

class EnderecoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MapaController()),
        Bind((i) => EnderecoRepository(Dio())),
        Bind((i) => EnderecoController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => EnderecoPage()),
        Router('/mapa', child: (_, args) => MapaPage()),
      ];

  static Inject get to => Inject<EnderecoModule>.of();
}
