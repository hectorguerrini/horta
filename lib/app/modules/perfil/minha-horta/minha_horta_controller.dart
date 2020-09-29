import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/perfil/models/horta_model.dart';
import 'package:horta/app/modules/perfil/repositories/minha_horta_repository.dart';

import 'package:horta/app/shared/auth/auth_controller.dart';
import 'package:horta/app/shared/components/toast_widget.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:oktoast/oktoast.dart';
part 'minha_horta_controller.g.dart';

class MinhaHortaController = _MinhaHortaControllerBase
    with _$MinhaHortaController;

abstract class _MinhaHortaControllerBase with Store {
  final AuthController _authController = Modular.get();
  final MinhaHortaRepository _repository = Modular.get();

  final TextEditingController nomeHortaCtrl = new TextEditingController();
  final TextEditingController minhaHistoriaCtrl = new TextEditingController();

  DateTime today = DateTime.now();

  @observable
  bool isLoading;

  @observable
  HortaModel hortaModel = new HortaModel();

  _MinhaHortaControllerBase() {
    isLoading = true;
    getMinhaHorta();
  }

  @action
  getMinhaHorta() async {
    try {
      hortaModel = await _repository.getMinhaHorta(_authController.user.uid);
      nomeHortaCtrl.text = hortaModel.nomeHorta;
      minhaHistoriaCtrl.text = hortaModel.minhaHistoria;
      isLoading = false;
    } catch (e) {
      print(e);
    }
  }

  @action
  changeNomeHorta(String value) =>
      hortaModel = hortaModel.copyWith(nomeHorta: nomeHortaCtrl.text);

  @action
  changeMinhaHistoria(String value) =>
      hortaModel = hortaModel.copyWith(minhaHistoria: minhaHistoriaCtrl.text);

  @action
  changeDinheiro(bool value) =>
      hortaModel = hortaModel.copyWith(dinheiro: value);

  @action
  changeCartaoDebito(bool value) =>
      hortaModel = hortaModel.copyWith(cartaoDebito: value);

  @action
  changeCartaoCredito(bool value) =>
      hortaModel = hortaModel.copyWith(cartaoCredito: value);

  @action
  setTimeAbertura(TimeOfDay value) => hortaModel = hortaModel.copyWith(
      abertura: DateTime(
          today.year, today.month, today.day, value.hour, value.minute));

  @action
  setTimeFechamento(TimeOfDay value) => hortaModel = hortaModel.copyWith(
      fechamento: DateTime(
          today.year, today.month, today.day, value.hour, value.minute));

  @computed
  String get getAberturaString => hortaModel.abertura != null
      ? DateFormat('jm').format(hortaModel.abertura)
      : 'Sem Horario';

  @computed
  String get getFechamentoString => hortaModel.fechamento != null
      ? DateFormat('jm').format(hortaModel.fechamento)
      : 'Sem Horario';

  @computed
  TimeOfDay get getAbertura => hortaModel.abertura != null
      ? TimeOfDay.fromDateTime(hortaModel.abertura)
      : TimeOfDay.now();

  @computed
  TimeOfDay get getFechamento => hortaModel.abertura != null
      ? TimeOfDay.fromDateTime(hortaModel.abertura)
      : TimeOfDay.now();

  @computed
  bool get getDinheiro => hortaModel.dinheiro;
  @computed
  bool get getCartaoDebito => hortaModel.cartaoDebito;
  @computed
  bool get getCartaoCredito => hortaModel.cartaoCredito;

  @computed
  bool get fieldsIsValid => hortaModel.nomeHorta?.isNotEmpty ?? false;

  @action
  save() async {
    try {
      hortaModel.reference = await _repository.salvarMinhaHorta(
          _authController.user.uid, hortaModel);

      showToastWidget(ToastWidget(msg: 'Informações da Horta Atualizadas.'),
          position: ToastPosition.bottom);
    } catch (e) {
      print(e);
    }
  }
}
