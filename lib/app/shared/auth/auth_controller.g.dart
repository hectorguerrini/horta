// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$userAtom = Atom(name: '_AuthControllerBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$isAgricultorAtom = Atom(name: '_AuthControllerBase.isAgricultor');

  @override
  bool get isAgricultor {
    _$isAgricultorAtom.reportRead();
    return super.isAgricultor;
  }

  @override
  set isAgricultor(bool value) {
    _$isAgricultorAtom.reportWrite(value, super.isAgricultor, () {
      super.isAgricultor = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_AuthControllerBase.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$reloadUserAsyncAction = AsyncAction('_AuthControllerBase.reloadUser');

  @override
  Future<dynamic> reloadUser() {
    return _$reloadUserAsyncAction.run(() => super.reloadUser());
  }

  final _$loginWithEmailAsyncAction =
      AsyncAction('_AuthControllerBase.loginWithEmail');

  @override
  Future<dynamic> loginWithEmail(String email, String senha) {
    return _$loginWithEmailAsyncAction
        .run(() => super.loginWithEmail(email, senha));
  }

  final _$loginWithGoogleAsyncAction =
      AsyncAction('_AuthControllerBase.loginWithGoogle');

  @override
  Future<dynamic> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  final _$registerWithEmailAsyncAction =
      AsyncAction('_AuthControllerBase.registerWithEmail');

  @override
  Future<dynamic> registerWithEmail(String nome, String email, String senha) {
    return _$registerWithEmailAsyncAction
        .run(() => super.registerWithEmail(nome, email, senha));
  }

  final _$getIsAgricultorAsyncAction =
      AsyncAction('_AuthControllerBase.getIsAgricultor');

  @override
  Future<dynamic> getIsAgricultor() {
    return _$getIsAgricultorAsyncAction.run(() => super.getIsAgricultor());
  }

  @override
  String toString() {
    return '''
user: ${user},
isAgricultor: ${isAgricultor}
    ''';
  }
}
