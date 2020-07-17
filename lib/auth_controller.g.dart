// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  Computed<String> _$photoUrlComputed;

  @override
  String get photoUrl =>
      (_$photoUrlComputed ??= Computed<String>(() => super.photoUrl,
              name: '_AuthControllerBase.photoUrl'))
          .value;
  Computed<String> _$displayNameComputed;

  @override
  String get displayName =>
      (_$displayNameComputed ??= Computed<String>(() => super.displayName,
              name: '_AuthControllerBase.displayName'))
          .value;
  Computed<String> _$emailComputed;

  @override
  String get email => (_$emailComputed ??= Computed<String>(() => super.email,
          name: '_AuthControllerBase.email'))
      .value;
  Computed<String> _$getUidComputed;

  @override
  String get getUid =>
      (_$getUidComputed ??= Computed<String>(() => super.getUid,
              name: '_AuthControllerBase.getUid'))
          .value;

  final _$userLoggedAtom = Atom(name: '_AuthControllerBase.userLogged');

  @override
  UserModel get userLogged {
    _$userLoggedAtom.reportRead();
    return super.userLogged;
  }

  @override
  set userLogged(UserModel value) {
    _$userLoggedAtom.reportWrite(value, super.userLogged, () {
      super.userLogged = value;
    });
  }

  final _$getUserAsyncAction = AsyncAction('_AuthControllerBase.getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$loginAsyncAction = AsyncAction('_AuthControllerBase.login');

  @override
  Future<dynamic> login(String email, String senha) {
    return _$loginAsyncAction.run(() => super.login(email, senha));
  }

  final _$signOutAsyncAction = AsyncAction('_AuthControllerBase.signOut');

  @override
  Future<dynamic> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  UserModel _userFromFirebaseUser({FirebaseUser user}) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase._userFromFirebaseUser');
    try {
      return super._userFromFirebaseUser(user: user);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userLogged: ${userLogged},
photoUrl: ${photoUrl},
displayName: ${displayName},
email: ${email},
getUid: ${getUid}
    ''';
  }
}
