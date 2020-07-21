import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:horta/models/horta_model.dart';
import 'package:horta/models/perfil_model.dart';
import 'package:horta/services/perfil.dart';
import 'package:mobx/mobx.dart';

part 'perfil_controller.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  final PerfilService _perfilService;
  final TextEditingController nomeCtrl = new TextEditingController();
  final TextEditingController cpfCtrl =
      new MaskedTextController(mask: '000.000.000-00');
  final TextEditingController wppCtrl =
      new MaskedTextController(mask: '(00) 00000-0000');

  final TextEditingController nomeHortaCtrl = new TextEditingController();
  final TextEditingController minhaHistoriaCtrl = new TextEditingController();

  _PerfilControllerBase(this._perfilService) {
    getPerfil();
    getHortaPerfil();
  }

  File image;
  DateTime today = DateTime.now();

  @observable
  PerfilModel perfil;

  @action
  getPerfil() async {
    perfil = await _perfilService.getUserPerfil();
    nomeCtrl.text = perfil.nome;
    cpfCtrl.text = perfil.cpf;
    wppCtrl.text = perfil.wpp;
  }

  @action
  changeNome(String value) => perfil = perfil.copyWith(nome: value);

  @action
  changeCpf(String value) => perfil = perfil.copyWith(cpf: value);

  @action
  changeWpp(String value) => perfil = perfil.copyWith(wpp: value);

  @action
  changeEmail(String value) => perfil = perfil.copyWith(email: value);

  @computed
  String get nome => perfil.nome;

  @computed
  String get cpf => perfil.cpf;

  @computed
  String get wpp => perfil.wpp;

  @computed
  String get email => perfil.email;

  @action
  Future savePerfil() async {
    return await _perfilService.updateUserPerfil(perfil);
  }

  @observable
  HortaModel minhaHorta;

  @action
  getHortaPerfil() async {
    minhaHorta = await _perfilService.gethortaPerfil();
    nomeHortaCtrl.text = minhaHorta.nomeHorta;
    minhaHistoriaCtrl.text = minhaHorta.minhaHistoria;
  }

  @action
  changeNomeHorta(String value) =>
      minhaHorta = minhaHorta.copyWith(nomeHorta: value);

  @action
  changeMinhaHistoria(String value) =>
      minhaHorta = minhaHorta.copyWith(minhaHistoria: value);

  @action
  changeDinheiro(bool value) =>
      minhaHorta = minhaHorta.copyWith(dinheiro: value);

  @action
  changeCartaoDebito(bool value) =>
      minhaHorta = minhaHorta.copyWith(cartaoDebito: value);

  @action
  changeCartaoCredito(bool value) =>
      minhaHorta = minhaHorta.copyWith(cartaoCredito: value);

  @action
  setTimeAbertura(TimeOfDay value) => minhaHorta = minhaHorta.copyWith(
      abertura: DateTime(
          today.year, today.month, today.day, value.hour, value.minute));

  @action
  setTimeFechamento(TimeOfDay value) => minhaHorta = minhaHorta.copyWith(
      fechamento: DateTime(
          today.year, today.month, today.day, value.hour, value.minute));

  @computed
  String get getAbertura => minhaHorta.abertura?.toString()?.substring(10, 16);

  @computed
  String get getFechamento =>
      minhaHorta.fechamento?.toString()?.substring(10, 16);

  @action
  Future saveHortaPerfil() async {
    return await _perfilService.updateHortaPerfil(minhaHorta);
  }

  dispose() {
    nomeCtrl.dispose();
    cpfCtrl.dispose();
    wppCtrl.dispose();

    nomeHortaCtrl.dispose();
    minhaHistoriaCtrl.dispose();
  }
}
