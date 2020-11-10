// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool> _$isLoggedComputed;

  @override
  bool get isLogged =>
      (_$isLoggedComputed ??= Computed<bool>(() => super.isLogged,
              name: '_HomeControllerBase.isLogged'))
          .value;
  Computed<int> _$getIndexPageComputed;

  @override
  int get getIndexPage =>
      (_$getIndexPageComputed ??= Computed<int>(() => super.getIndexPage,
              name: '_HomeControllerBase.getIndexPage'))
          .value;
  Computed<bool> _$getIsAgricultorComputed;

  @override
  bool get getIsAgricultor =>
      (_$getIsAgricultorComputed ??= Computed<bool>(() => super.getIsAgricultor,
              name: '_HomeControllerBase.getIsAgricultor'))
          .value;

  final _$_selectedPageAtom = Atom(name: '_HomeControllerBase._selectedPage');

  @override
  int get _selectedPage {
    _$_selectedPageAtom.reportRead();
    return super._selectedPage;
  }

  @override
  set _selectedPage(int value) {
    _$_selectedPageAtom.reportWrite(value, super._selectedPage, () {
      super._selectedPage = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_HomeControllerBase.login');

  @override
  Future login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic pageChanged(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.pageChanged');
    try {
      return super.pageChanged(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic bottomTapped(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.bottomTapped');
    try {
      return super.bottomTapped(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogged: ${isLogged},
getIndexPage: ${getIndexPage},
getIsAgricultor: ${getIsAgricultor}
    ''';
  }
}
