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

  final _$isAgricultorAtom = Atom(name: '_HomeControllerBase.isAgricultor');

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

  final _$getIsAgricultorAsyncAction =
      AsyncAction('_HomeControllerBase.getIsAgricultor');

  @override
  Future getIsAgricultor() {
    return _$getIsAgricultorAsyncAction.run(() => super.getIsAgricultor());
  }

  @override
  String toString() {
    return '''
isAgricultor: ${isAgricultor},
isLogged: ${isLogged}
    ''';
  }
}
