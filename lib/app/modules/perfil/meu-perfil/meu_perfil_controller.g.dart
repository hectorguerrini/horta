// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meu_perfil_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MeuPerfilController on _MeuPerfilControllerBase, Store {
  Computed<String> _$getUserEmailComputed;

  @override
  String get getUserEmail =>
      (_$getUserEmailComputed ??= Computed<String>(() => super.getUserEmail,
              name: '_MeuPerfilControllerBase.getUserEmail'))
          .value;
  Computed<String> _$getUserNomeComputed;

  @override
  String get getUserNome =>
      (_$getUserNomeComputed ??= Computed<String>(() => super.getUserNome,
              name: '_MeuPerfilControllerBase.getUserNome'))
          .value;
  Computed<bool> _$getNomeValidComputed;

  @override
  bool get getNomeValid =>
      (_$getNomeValidComputed ??= Computed<bool>(() => super.getNomeValid,
              name: '_MeuPerfilControllerBase.getNomeValid'))
          .value;
  Computed<bool> _$getCpfValidComputed;

  @override
  bool get getCpfValid =>
      (_$getCpfValidComputed ??= Computed<bool>(() => super.getCpfValid,
              name: '_MeuPerfilControllerBase.getCpfValid'))
          .value;
  Computed<bool> _$getCelularValidComputed;

  @override
  bool get getCelularValid =>
      (_$getCelularValidComputed ??= Computed<bool>(() => super.getCelularValid,
              name: '_MeuPerfilControllerBase.getCelularValid'))
          .value;
  Computed<bool> _$fieldsIsValidComputed;

  @override
  bool get fieldsIsValid =>
      (_$fieldsIsValidComputed ??= Computed<bool>(() => super.fieldsIsValid,
              name: '_MeuPerfilControllerBase.fieldsIsValid'))
          .value;

  final _$isLoadingAtom = Atom(name: '_MeuPerfilControllerBase.isLoading');

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

  final _$perfilModelAtom = Atom(name: '_MeuPerfilControllerBase.perfilModel');

  @override
  PerfilModel get perfilModel {
    _$perfilModelAtom.reportRead();
    return super.perfilModel;
  }

  @override
  set perfilModel(PerfilModel value) {
    _$perfilModelAtom.reportWrite(value, super.perfilModel, () {
      super.perfilModel = value;
    });
  }

  final _$getPerfilAsyncAction =
      AsyncAction('_MeuPerfilControllerBase.getPerfil');

  @override
  Future getPerfil() {
    return _$getPerfilAsyncAction.run(() => super.getPerfil());
  }

  final _$saveAsyncAction = AsyncAction('_MeuPerfilControllerBase.save');

  @override
  Future save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$_MeuPerfilControllerBaseActionController =
      ActionController(name: '_MeuPerfilControllerBase');

  @override
  dynamic changeCpf(String value) {
    final _$actionInfo = _$_MeuPerfilControllerBaseActionController.startAction(
        name: '_MeuPerfilControllerBase.changeCpf');
    try {
      return super.changeCpf(value);
    } finally {
      _$_MeuPerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCelular(String value) {
    final _$actionInfo = _$_MeuPerfilControllerBaseActionController.startAction(
        name: '_MeuPerfilControllerBase.changeCelular');
    try {
      return super.changeCelular(value);
    } finally {
      _$_MeuPerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
perfilModel: ${perfilModel},
getUserEmail: ${getUserEmail},
getUserNome: ${getUserNome},
getNomeValid: ${getNomeValid},
getCpfValid: ${getCpfValid},
getCelularValid: ${getCelularValid},
fieldsIsValid: ${fieldsIsValid}
    ''';
  }
}
