// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clientes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientesController on _ClientesControllerBase, Store {
  final _$valueAtom = Atom(name: '_ClientesControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_ClientesControllerBaseActionController =
      ActionController(name: '_ClientesControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ClientesControllerBaseActionController.startAction(
        name: '_ClientesControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ClientesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
