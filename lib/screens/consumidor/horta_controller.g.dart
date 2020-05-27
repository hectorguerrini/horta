// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horta_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HortaController on _HortaControllerBase, Store {
  final _$listaHortasAtom = Atom(name: '_HortaControllerBase.listaHortas');

  @override
  ObservableStream<List<HortaModel>> get listaHortas {
    _$listaHortasAtom.reportRead();
    return super.listaHortas;
  }

  @override
  set listaHortas(ObservableStream<List<HortaModel>> value) {
    _$listaHortasAtom.reportWrite(value, super.listaHortas, () {
      super.listaHortas = value;
    });
  }

  final _$detalheHortaAtom = Atom(name: '_HortaControllerBase.detalheHorta');

  @override
  HortaModel get detalheHorta {
    _$detalheHortaAtom.reportRead();
    return super.detalheHorta;
  }

  @override
  set detalheHorta(HortaModel value) {
    _$detalheHortaAtom.reportWrite(value, super.detalheHorta, () {
      super.detalheHorta = value;
    });
  }

  final _$_HortaControllerBaseActionController =
      ActionController(name: '_HortaControllerBase');

  @override
  dynamic getListaHortas() {
    final _$actionInfo = _$_HortaControllerBaseActionController.startAction(
        name: '_HortaControllerBase.getListaHortas');
    try {
      return super.getListaHortas();
    } finally {
      _$_HortaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDetalheHorta(HortaModel value) {
    final _$actionInfo = _$_HortaControllerBaseActionController.startAction(
        name: '_HortaControllerBase.setDetalheHorta');
    try {
      return super.setDetalheHorta(value);
    } finally {
      _$_HortaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaHortas: ${listaHortas},
detalheHorta: ${detalheHorta}
    ''';
  }
}
