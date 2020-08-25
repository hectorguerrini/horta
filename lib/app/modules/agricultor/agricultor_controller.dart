import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/agricultor/repositories/agricultor_repository.dart';
import 'package:horta/app/shared/components/toast_widget.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:oktoast/oktoast.dart';

import 'models/produtos_model.dart';

part 'agricultor_controller.g.dart';

class AgricultorController = _AgricultorControllerBase
    with _$AgricultorController;

abstract class _AgricultorControllerBase with Store {
  final AgricultorRepository _repository = Modular.get();
  final NumberFormat currency = new NumberFormat.currency(
      locale: "pt_BR", decimalDigits: 2, symbol: "R\$");

  @observable
  ObservableStream<List<ProdutosModel>> listaProdutos;

  _AgricultorControllerBase() {
    if (listaProdutos == null) {
      getMeusProdutos();
    }
  }

  @action
  getMeusProdutos() {
    listaProdutos = _repository.getMeusProdutos().asObservable();
  }

  @action
  changeDisponibilidade(bool value, ProdutosModel item) async {
    item = item.copyWith(disponibilidade: value);
    await _repository.updateMeusProdutos(item);
    showToastWidget(
        ToastWidget(
          msg: 'Alterado com sucesso',
        ),
        duration: Duration(seconds: 2));
  }
}
