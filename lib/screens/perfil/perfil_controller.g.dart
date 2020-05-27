// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilController on _PerfilControllerBase, Store {
  Computed<String> _$nomeComputed;

  @override
  String get nome => (_$nomeComputed ??= Computed<String>(() => super.nome,
          name: '_PerfilControllerBase.nome'))
      .value;
  Computed<String> _$cpfComputed;

  @override
  String get cpf => (_$cpfComputed ??=
          Computed<String>(() => super.cpf, name: '_PerfilControllerBase.cpf'))
      .value;
  Computed<String> _$wppComputed;

  @override
  String get wpp => (_$wppComputed ??=
          Computed<String>(() => super.wpp, name: '_PerfilControllerBase.wpp'))
      .value;
  Computed<String> _$emailComputed;

  @override
  String get email => (_$emailComputed ??= Computed<String>(() => super.email,
          name: '_PerfilControllerBase.email'))
      .value;
  Computed<String> _$getAberturaComputed;

  @override
  String get getAbertura =>
      (_$getAberturaComputed ??= Computed<String>(() => super.getAbertura,
              name: '_PerfilControllerBase.getAbertura'))
          .value;
  Computed<String> _$getFechamentoComputed;

  @override
  String get getFechamento =>
      (_$getFechamentoComputed ??= Computed<String>(() => super.getFechamento,
              name: '_PerfilControllerBase.getFechamento'))
          .value;

  final _$perfilAtom = Atom(name: '_PerfilControllerBase.perfil');

  @override
  PerfilModel get perfil {
    _$perfilAtom.reportRead();
    return super.perfil;
  }

  @override
  set perfil(PerfilModel value) {
    _$perfilAtom.reportWrite(value, super.perfil, () {
      super.perfil = value;
    });
  }

  final _$minhaHortaAtom = Atom(name: '_PerfilControllerBase.minhaHorta');

  @override
  HortaModel get minhaHorta {
    _$minhaHortaAtom.reportRead();
    return super.minhaHorta;
  }

  @override
  set minhaHorta(HortaModel value) {
    _$minhaHortaAtom.reportWrite(value, super.minhaHorta, () {
      super.minhaHorta = value;
    });
  }

  final _$getPerfilAsyncAction = AsyncAction('_PerfilControllerBase.getPerfil');

  @override
  Future getPerfil() {
    return _$getPerfilAsyncAction.run(() => super.getPerfil());
  }

  final _$savePerfilAsyncAction =
      AsyncAction('_PerfilControllerBase.savePerfil');

  @override
  Future<dynamic> savePerfil() {
    return _$savePerfilAsyncAction.run(() => super.savePerfil());
  }

  final _$getHortaPerfilAsyncAction =
      AsyncAction('_PerfilControllerBase.getHortaPerfil');

  @override
  Future getHortaPerfil() {
    return _$getHortaPerfilAsyncAction.run(() => super.getHortaPerfil());
  }

  final _$saveHortaPerfilAsyncAction =
      AsyncAction('_PerfilControllerBase.saveHortaPerfil');

  @override
  Future<dynamic> saveHortaPerfil() {
    return _$saveHortaPerfilAsyncAction.run(() => super.saveHortaPerfil());
  }

  final _$_PerfilControllerBaseActionController =
      ActionController(name: '_PerfilControllerBase');

  @override
  dynamic changeNome(String value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.changeNome');
    try {
      return super.changeNome(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCpf(String value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.changeCpf');
    try {
      return super.changeCpf(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeWpp(String value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.changeWpp');
    try {
      return super.changeWpp(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNomeHorta(String value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.changeNomeHorta');
    try {
      return super.changeNomeHorta(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeMinhaHistoria(String value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.changeMinhaHistoria');
    try {
      return super.changeMinhaHistoria(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDinheiro(bool value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.changeDinheiro');
    try {
      return super.changeDinheiro(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCartaoDebito(bool value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.changeCartaoDebito');
    try {
      return super.changeCartaoDebito(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCartaoCredito(bool value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.changeCartaoCredito');
    try {
      return super.changeCartaoCredito(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTimeAbertura(TimeOfDay value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.setTimeAbertura');
    try {
      return super.setTimeAbertura(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTimeFechamento(TimeOfDay value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.setTimeFechamento');
    try {
      return super.setTimeFechamento(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
perfil: ${perfil},
minhaHorta: ${minhaHorta},
nome: ${nome},
cpf: ${cpf},
wpp: ${wpp},
email: ${email},
getAbertura: ${getAbertura},
getFechamento: ${getFechamento}
    ''';
  }
}
