// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  final _$registerModelAtom =
      Atom(name: '_RegisterControllerBase.registerModel');

  @override
  RegisterModel get registerModel {
    _$registerModelAtom.reportRead();
    return super.registerModel;
  }

  @override
  set registerModel(RegisterModel value) {
    _$registerModelAtom.reportWrite(value, super.registerModel, () {
      super.registerModel = value;
    });
  }

  final _$_authAtom = Atom(name: '_RegisterControllerBase._auth');

  @override
  FirebaseAuth get _auth {
    _$_authAtom.reportRead();
    return super._auth;
  }

  @override
  set _auth(FirebaseAuth value) {
    _$_authAtom.reportWrite(value, super._auth, () {
      super._auth = value;
    });
  }

  final _$registerWithEmailAndPasswordAsyncAction =
      AsyncAction('_RegisterControllerBase.registerWithEmailAndPassword');

  @override
  Future registerWithEmailAndPassword() {
    return _$registerWithEmailAndPasswordAsyncAction
        .run(() => super.registerWithEmailAndPassword());
  }

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  dynamic setNome(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUser(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSenha(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
registerModel: ${registerModel}
    ''';
  }
}
