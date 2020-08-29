// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$userAtom = Atom(name: '_AuthControllerBase.user');

  @override
  FirebaseUser get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(FirebaseUser value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
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

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  dynamic setUser(FirebaseUser value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
