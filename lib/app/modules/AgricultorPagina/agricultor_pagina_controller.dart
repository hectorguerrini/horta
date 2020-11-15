import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'agricultor_pagina_controller.g.dart';

@Injectable()
class AgricultorPaginaController = _AgricultorPaginaControllerBase
    with _$AgricultorPaginaController;

abstract class _AgricultorPaginaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
