// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilController on _PerfilControllerBase, Store {
  Computed<String> _$getUserEmailComputed;

  @override
  String get getUserEmail =>
      (_$getUserEmailComputed ??= Computed<String>(() => super.getUserEmail,
              name: '_PerfilControllerBase.getUserEmail'))
          .value;
  Computed<String> _$getUserNomeComputed;

  @override
  String get getUserNome =>
      (_$getUserNomeComputed ??= Computed<String>(() => super.getUserNome,
              name: '_PerfilControllerBase.getUserNome'))
          .value;
  Computed<bool> _$getIsAgricultorComputed;

  @override
  bool get getIsAgricultor =>
      (_$getIsAgricultorComputed ??= Computed<bool>(() => super.getIsAgricultor,
              name: '_PerfilControllerBase.getIsAgricultor'))
          .value;

  @override
  String toString() {
    return '''
getUserEmail: ${getUserEmail},
getUserNome: ${getUserNome},
getIsAgricultor: ${getIsAgricultor}
    ''';
  }
}
