import 'package:horta/app/modules/agricultor/cadastro-produto/cadastro_produto_controller.dart';
import 'package:horta/app/modules/agricultor/cadastro-produto/cadatro_produto_page.dart';

import 'repositories/agricultor_repository.dart';
import 'agricultor_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'agricultor_page.dart';

class AgricultorModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AgricultorRepository()),
        Bind((i) => AgricultorController()),
        Bind((i) => CadastroProdutoController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AgricultorPage()),
        Router('/produto', child: (_, args) => CadastroProdutoPage()),
      ];

  static Inject get to => Inject<AgricultorModule>.of();
}
