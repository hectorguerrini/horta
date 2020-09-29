import 'package:mobx/mobx.dart';

part 'clientes_controller.g.dart';

class ClientesController = _ClientesControllerBase with _$ClientesController;

abstract class _ClientesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
