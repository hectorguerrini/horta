// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_LoginControllerBase.isValid'))
      .value;

  final _$msgAtom = Atom(name: '_LoginControllerBase.msg');

  @override
  String get msg {
    _$msgAtom.reportRead();
    return super.msg;
  }

  @override
  set msg(String value) {
    _$msgAtom.reportWrite(value, super.msg, () {
      super.msg = value;
    });
  }

  final _$loginModelAtom = Atom(name: '_LoginControllerBase.loginModel');

  @override
  LoginModel get loginModel {
    _$loginModelAtom.reportRead();
    return super.loginModel;
  }

  @override
  set loginModel(LoginModel value) {
    _$loginModelAtom.reportWrite(value, super.loginModel, () {
      super.loginModel = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginControllerBase.login');

  @override
  Future login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$loginGoogleAsyncAction =
      AsyncAction('_LoginControllerBase.loginGoogle');

  @override
  Future loginGoogle() {
    return _$loginGoogleAsyncAction.run(() => super.loginGoogle());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSenha(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
msg: ${msg},
loginModel: ${loginModel},
isValid: ${isValid}
    ''';
  }
}
