// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menuAgricultor_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MenuAgricultorController on _MenuAgricultorControllerBase, Store {
  Computed<String> _$nomeProdutoComputed;

  @override
  String get nomeProduto =>
      (_$nomeProdutoComputed ??= Computed<String>(() => super.nomeProduto,
              name: '_MenuAgricultorControllerBase.nomeProduto'))
          .value;
  Computed<String> _$iconProdutoComputed;

  @override
  String get iconProduto =>
      (_$iconProdutoComputed ??= Computed<String>(() => super.iconProduto,
              name: '_MenuAgricultorControllerBase.iconProduto'))
          .value;
  Computed<String> _$unidadeProdutoComputed;

  @override
  String get unidadeProduto =>
      (_$unidadeProdutoComputed ??= Computed<String>(() => super.unidadeProduto,
              name: '_MenuAgricultorControllerBase.unidadeProduto'))
          .value;
  Computed<double> _$precoProdutoComputed;

  @override
  double get precoProduto =>
      (_$precoProdutoComputed ??= Computed<double>(() => super.precoProduto,
              name: '_MenuAgricultorControllerBase.precoProduto'))
          .value;

  final _$listaProdutosAtom =
      Atom(name: '_MenuAgricultorControllerBase.listaProdutos');

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

  final _$selectProdutoAtom =
      Atom(name: '_MenuAgricultorControllerBase.selectProduto');

  @override
  ProdutosModel get selectProduto {
    _$selectProdutoAtom.reportRead();
    return super.selectProduto;
  }

  @override
  set selectProduto(ProdutosModel value) {
    _$selectProdutoAtom.reportWrite(value, super.selectProduto, () {
      super.selectProduto = value;
    });
  }

  final _$comboProdutosAtom =
      Atom(name: '_MenuAgricultorControllerBase.comboProdutos');

  @override
  List<ProdutosModel> get comboProdutos {
    _$comboProdutosAtom.reportRead();
    return super.comboProdutos;
  }

  @override
  set comboProdutos(List<ProdutosModel> value) {
    _$comboProdutosAtom.reportWrite(value, super.comboProdutos, () {
      super.comboProdutos = value;
    });
  }

  final _$getComboProdutosAsyncAction =
      AsyncAction('_MenuAgricultorControllerBase.getComboProdutos');

  @override
  Future getComboProdutos() {
    return _$getComboProdutosAsyncAction.run(() => super.getComboProdutos());
  }

  final _$salvarAsyncAction =
      AsyncAction('_MenuAgricultorControllerBase.salvar');

  @override
  Future salvar() {
    return _$salvarAsyncAction.run(() => super.salvar());
  }

  final _$_MenuAgricultorControllerBaseActionController =
      ActionController(name: '_MenuAgricultorControllerBase');

  @override
  dynamic getMeusProdutos() {
    final _$actionInfo = _$_MenuAgricultorControllerBaseActionController
        .startAction(name: '_MenuAgricultorControllerBase.getMeusProdutos');
    try {
      return super.getMeusProdutos();
    } finally {
      _$_MenuAgricultorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProduto(String nmProduto) {
    final _$actionInfo = _$_MenuAgricultorControllerBaseActionController
        .startAction(name: '_MenuAgricultorControllerBase.setProduto');
    try {
      return super.setProduto(nmProduto);
    } finally {
      _$_MenuAgricultorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPreco(String value) {
    final _$actionInfo = _$_MenuAgricultorControllerBaseActionController
        .startAction(name: '_MenuAgricultorControllerBase.setPreco');
    try {
      return super.setPreco(value);
    } finally {
      _$_MenuAgricultorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUnidade(String unidade) {
    final _$actionInfo = _$_MenuAgricultorControllerBaseActionController
        .startAction(name: '_MenuAgricultorControllerBase.setUnidade');
    try {
      return super.setUnidade(unidade);
    } finally {
      _$_MenuAgricultorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDisponibilidade(bool value, ProdutosModel item) {
    final _$actionInfo =
        _$_MenuAgricultorControllerBaseActionController.startAction(
            name: '_MenuAgricultorControllerBase.changeDisponibilidade');
    try {
      return super.changeDisponibilidade(value, item);
    } finally {
      _$_MenuAgricultorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic editProduto(ProdutosModel _produto) {
    final _$actionInfo = _$_MenuAgricultorControllerBaseActionController
        .startAction(name: '_MenuAgricultorControllerBase.editProduto');
    try {
      return super.editProduto(_produto);
    } finally {
      _$_MenuAgricultorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaProdutos: ${listaProdutos},
selectProduto: ${selectProduto},
comboProdutos: ${comboProdutos},
nomeProduto: ${nomeProduto},
iconProduto: ${iconProduto},
unidadeProduto: ${unidadeProduto},
precoProduto: ${precoProduto}
    ''';
  }
}
