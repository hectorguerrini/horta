import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/perfil/models/perfil_model.dart';
import 'package:horta/app/modules/perfil/repositories/perfil_repository.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';
import 'package:horta/app/shared/components/toast_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:oktoast/oktoast.dart';
part 'meu_perfil_controller.g.dart';

class MeuPerfilController = _MeuPerfilControllerBase with _$MeuPerfilController;

abstract class _MeuPerfilControllerBase with Store {
  final AuthController _authController = Modular.get();
  final PerfilRepository _repository = Modular.get();
  final TextEditingController nomeCtrl = new TextEditingController();
  final MaskedTextController cpfCtrl =
      new MaskedTextController(mask: '000.000.000-00');
  final MaskedTextController celularCtrl =
      new MaskedTextController(mask: '(00) 00000-0000');

  @observable
  bool isLoading;

  @observable
  PerfilModel perfilModel = new PerfilModel();
  _MeuPerfilControllerBase() {
    isLoading = true;
    getPerfil();
    nomeCtrl.text = _authController.user.displayName;
  }

  @action
  getPerfil() async {
    try {
      perfilModel = await _repository.getPerfil(_authController.user.uid);
      cpfCtrl.text = perfilModel.cpf;
      celularCtrl.text = perfilModel.celular;
      isLoading = false;
    } catch (e) {
      print(e);
    }
  }

  @computed
  String get getUserEmail => _authController.user.email;

  @computed
  String get getUserNome => _authController.user.displayName ?? '';

  @action
  changeCpf(String value) =>
      perfilModel = perfilModel.copyWith(cpf: cpfCtrl.text);

  @action
  changeCelular(String value) =>
      perfilModel = perfilModel.copyWith(celular: celularCtrl.text);

  @computed
  bool get getNomeValid => isLoading || nomeCtrl.text.isNotEmpty;

  @computed
  bool get getCpfValid => isLoading || testaCPF(perfilModel?.cpf);

  @computed
  bool get getCelularValid => isLoading || perfilModel.celular.length == 15;

  @computed
  bool get fieldsIsValid => getNomeValid && getCpfValid && getCelularValid;

  @action
  save() async {
    try {
      perfilModel.reference =
          await _repository.salvarPerfil(_authController.user.uid, perfilModel);
      if (nomeCtrl.text != _authController.user.displayName) {
        _repository.updatePerfil(_authController.user,
            displayName: nomeCtrl.text);
        _authController.reloadUser();
      }

      showToastWidget(ToastWidget(msg: 'Perfil Atualizado'),
          position: ToastPosition.bottom);
    } catch (e) {
      print(e);
    }
  }

  bool testaCPF(String strCPF) {
    if (strCPF == null) return false;
    int soma = 0;
    int resto;
    strCPF = strCPF.replaceAll(new RegExp(r'[^\d]+'), '');
    if (strCPF == '00000000000') return false;
    if (strCPF.length < 11) return false;

    for (var i = 1; i <= 9; i++)
      soma = soma + int.parse(strCPF.substring(i - 1, i)) * (11 - i);
    resto = (soma * 10) % 11;

    if ((resto == 10) || (resto == 11)) resto = 0;
    if (resto != int.parse(strCPF.substring(9, 10))) return false;

    soma = 0;
    for (var j = 1; j <= 10; j++)
      soma = soma + int.parse(strCPF.substring(j - 1, j)) * (12 - j);
    resto = (soma * 10) % 11;

    if ((resto == 10) || (resto == 11)) resto = 0;
    if (resto != int.parse(strCPF.substring(10, 11))) return false;
    return true;
  }
}
