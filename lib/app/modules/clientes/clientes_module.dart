import 'clientes_controller.dart';
import 'repositories/clientes_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'clientes_page.dart';

class ClientesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClientesController()),
        Bind((i) => ClientesRepository(Dio())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ClientesPage()),
      ];

  static Inject get to => Inject<ClientesModule>.of();
}
