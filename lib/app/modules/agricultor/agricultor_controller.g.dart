// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agricultor_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AgricultorController on _AgricultorControllerBase, Store {
  final _$listaProdutosAtom =
      Atom(name: '_AgricultorControllerBase.listaProdutos');

  @override
  ObservableStream<List<ProdutosModel>> get listaProdutos {
    _$listaProdutosAtom.reportRead();
    return super.listaProdutos;
  }

  @override
  set listaProdutos(ObservableStream<List<ProdutosModel>> value) {
    _$listaProdutosAtom.reportWrite(value, super.listaProdutos, () {
      super.listaProdutos = value;
    });
  }

  final _$changeDisponibilidadeAsyncAction =
      AsyncAction('_AgricultorControllerBase.changeDisponibilidade');

  @override
  Future changeDisponibilidade(bool value, ProdutosModel item) {
    return _$changeDisponibilidadeAsyncAction
        .run(() => super.changeDisponibilidade(value, item));
  }

  final _$_AgricultorControllerBaseActionController =
      ActionController(name: '_AgricultorControllerBase');

  @override
  dynamic getMeusProdutos() {
    final _$actionInfo = _$_AgricultorControllerBaseActionController
        .startAction(name: '_AgricultorControllerBase.getMeusProdutos');
    try {
      return super.getMeusProdutos();
    } finally {
      _$_AgricultorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaProdutos: ${listaProdutos}
    ''';
  }
}
