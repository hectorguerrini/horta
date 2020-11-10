// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minha_horta_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MinhaHortaController on _MinhaHortaControllerBase, Store {
  Computed<String> _$getAberturaStringComputed;

  @override
  String get getAberturaString => (_$getAberturaStringComputed ??=
          Computed<String>(() => super.getAberturaString,
              name: '_MinhaHortaControllerBase.getAberturaString'))
      .value;
  Computed<String> _$getFechamentoStringComputed;

  @override
  String get getFechamentoString => (_$getFechamentoStringComputed ??=
          Computed<String>(() => super.getFechamentoString,
              name: '_MinhaHortaControllerBase.getFechamentoString'))
      .value;
  Computed<TimeOfDay> _$getAberturaComputed;

  @override
  TimeOfDay get getAbertura =>
      (_$getAberturaComputed ??= Computed<TimeOfDay>(() => super.getAbertura,
              name: '_MinhaHortaControllerBase.getAbertura'))
          .value;
  Computed<TimeOfDay> _$getFechamentoComputed;

  @override
  TimeOfDay get getFechamento => (_$getFechamentoComputed ??=
          Computed<TimeOfDay>(() => super.getFechamento,
              name: '_MinhaHortaControllerBase.getFechamento'))
      .value;
  Computed<bool> _$getDinheiroComputed;

  @override
  bool get getDinheiro =>
      (_$getDinheiroComputed ??= Computed<bool>(() => super.getDinheiro,
              name: '_MinhaHortaControllerBase.getDinheiro'))
          .value;
  Computed<bool> _$getCartaoDebitoComputed;

  @override
  bool get getCartaoDebito =>
      (_$getCartaoDebitoComputed ??= Computed<bool>(() => super.getCartaoDebito,
              name: '_MinhaHortaControllerBase.getCartaoDebito'))
          .value;
  Computed<bool> _$getCartaoCreditoComputed;

  @override
  bool get getCartaoCredito => (_$getCartaoCreditoComputed ??= Computed<bool>(
          () => super.getCartaoCredito,
          name: '_MinhaHortaControllerBase.getCartaoCredito'))
      .value;
  Computed<bool> _$fieldsIsValidComputed;

  @override
  bool get fieldsIsValid =>
      (_$fieldsIsValidComputed ??= Computed<bool>(() => super.fieldsIsValid,
              name: '_MinhaHortaControllerBase.fieldsIsValid'))
          .value;

  final _$isLoadingAtom = Atom(name: '_MinhaHortaControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$hortaModelAtom = Atom(name: '_MinhaHortaControllerBase.hortaModel');

  @override
  HortaModel get hortaModel {
    _$hortaModelAtom.reportRead();
    return super.hortaModel;
  }

  @override
  set hortaModel(HortaModel value) {
    _$hortaModelAtom.reportWrite(value, super.hortaModel, () {
      super.hortaModel = value;
    });
  }

  final _$getMinhaHortaAsyncAction =
      AsyncAction('_MinhaHortaControllerBase.getMinhaHorta');

  @override
  Future getMinhaHorta() {
    return _$getMinhaHortaAsyncAction.run(() => super.getMinhaHorta());
  }

  final _$saveAsyncAction = AsyncAction('_MinhaHortaControllerBase.save');

  @override
  Future save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$_MinhaHortaControllerBaseActionController =
      ActionController(name: '_MinhaHortaControllerBase');

  @override
  dynamic changeNomeHorta(String value) {
    final _$actionInfo = _$_MinhaHortaControllerBaseActionController
        .startAction(name: '_MinhaHortaControllerBase.changeNomeHorta');
    try {
      return super.changeNomeHorta(value);
    } finally {
      _$_MinhaHortaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeMinhaHistoria(String value) {
    final _$actionInfo = _$_MinhaHortaControllerBaseActionController
        .startAction(name: '_MinhaHortaControllerBase.changeMinhaHistoria');
    try {
      return super.changeMinhaHistoria(value);
    } finally {
      _$_MinhaHortaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDinheiro(bool value) {
    final _$actionInfo = _$_MinhaHortaControllerBaseActionController
        .startAction(name: '_MinhaHortaControllerBase.changeDinheiro');
    try {
      return super.changeDinheiro(value);
    } finally {
      _$_MinhaHortaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCartaoDebito(bool value) {
    final _$actionInfo = _$_MinhaHortaControllerBaseActionController
        .startAction(name: '_MinhaHortaControllerBase.changeCartaoDebito');
    try {
      return super.changeCartaoDebito(value);
    } finally {
      _$_MinhaHortaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCartaoCredito(bool value) {
    final _$actionInfo = _$_MinhaHortaControllerBaseActionController
        .startAction(name: '_MinhaHortaControllerBase.changeCartaoCredito');
    try {
      return super.changeCartaoCredito(value);
    } finally {
      _$_MinhaHortaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTimeAbertura(TimeOfDay value) {
    final _$actionInfo = _$_MinhaHortaControllerBaseActionController
        .startAction(name: '_MinhaHortaControllerBase.setTimeAbertura');
    try {
      return super.setTimeAbertura(value);
    } finally {
      _$_MinhaHortaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTimeFechamento(TimeOfDay value) {
    final _$actionInfo = _$_MinhaHortaControllerBaseActionController
        .startAction(name: '_MinhaHortaControllerBase.setTimeFechamento');
    try {
      return super.setTimeFechamento(value);
    } finally {
      _$_MinhaHortaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hortaModel: ${hortaModel},
getAberturaString: ${getAberturaString},
getFechamentoString: ${getFechamentoString},
getAbertura: ${getAbertura},
getFechamento: ${getFechamento},
getDinheiro: ${getDinheiro},
getCartaoDebito: ${getCartaoDebito},
getCartaoCredito: ${getCartaoCredito},
fieldsIsValid: ${fieldsIsValid}
    ''';
  }
}
