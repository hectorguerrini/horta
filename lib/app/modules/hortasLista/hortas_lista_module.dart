import 'hortas_lista_controller.dart';
import 'package:dio/dio.dart';
import 'repositories/hortas_lista_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'hortas_lista_page.dart';
import 'package:horta/app/modules/agricultor/cadastro-produto/cadastro_produto_controller.dart';
import 'package:horta/app/modules/agricultor/cadastro-produto/cadastro_produto_page.dart';
import 'package:horta/app/modules/endereco/endereco_controller.dart';
import 'package:horta/app/modules/endereco/mapa/mapa_controller.dart';
import 'package:horta/app/modules/endereco/repositories/endereco_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/agricultorPagina/agricultor_pagina_page.dart';

class HortasListaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //$HortasListaController,
        //$HortasListaRepository,
        Bind((i) => MapaController()),
        Bind((i) => HortasListaRepository()),
        Bind((i) => HortasListaController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => HortasListaPage()),
        ModularRouter('/agricultorPagina',
            child: (_, args) => AgricultorPaginaPage()),
      ];

  static Inject get to => Inject<HortasListaModule>.of();
}
