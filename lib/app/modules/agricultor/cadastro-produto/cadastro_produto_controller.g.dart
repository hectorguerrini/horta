// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroProdutoController on _CadastroProdutoControllerBase, Store {
  Computed<List<ProdutosModel>> _$getMeusProdutosComputed;

  @override
  List<ProdutosModel> get getMeusProdutos => (_$getMeusProdutosComputed ??=
          Computed<List<ProdutosModel>>(() => super.getMeusProdutos,
              name: '_CadastroProdutoControllerBase.getMeusProdutos'))
      .value;
  Computed<Hortalicas> _$getNomeProdutoComputed;

  @override
  Hortalicas get getNomeProduto => (_$getNomeProdutoComputed ??=
          Computed<Hortalicas>(() => super.getNomeProduto,
              name: '_CadastroProdutoControllerBase.getNomeProduto'))
      .value;
  Computed<String> _$getIconProdutoComputed;

  @override
  String get getIconProduto =>
      (_$getIconProdutoComputed ??= Computed<String>(() => super.getIconProduto,
              name: '_CadastroProdutoControllerBase.getIconProduto'))
          .value;
  Computed<Unidade> _$getUnidadeProdutoComputed;

  @override
  Unidade get getUnidadeProduto => (_$getUnidadeProdutoComputed ??=
          Computed<Unidade>(() => super.getUnidadeProduto,
              name: '_CadastroProdutoControllerBase.getUnidadeProduto'))
      .value;
  Computed<double> _$getPrecoProdutoComputed;

  @override
  double get getPrecoProduto => (_$getPrecoProdutoComputed ??= Computed<double>(
          () => super.getPrecoProduto,
          name: '_CadastroProdutoControllerBase.getPrecoProduto'))
      .value;
  Computed<String> _$getPriceComputed;

  @override
  String get getPrice =>
      (_$getPriceComputed ??= Computed<String>(() => super.getPrice,
              name: '_CadastroProdutoControllerBase.getPrice'))
          .value;

  final _$selectProdutoAtom =
      Atom(name: '_CadastroProdutoControllerBase.selectProduto');

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

  final _$salvarAsyncAction =
      AsyncAction('_CadastroProdutoControllerBase.salvar');

  @override
  Future salvar() {
    return _$salvarAsyncAction.run(() => super.salvar());
  }

  final _$_CadastroProdutoControllerBaseActionController =
      ActionController(name: '_CadastroProdutoControllerBase');

  @override
  dynamic setProduto(Hortalicas value) {
    final _$actionInfo = _$_CadastroProdutoControllerBaseActionController
        .startAction(name: '_CadastroProdutoControllerBase.setProduto');
    try {
      return super.setProduto(value);
    } finally {
      _$_CadastroProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPreco(String value) {
    final _$actionInfo = _$_CadastroProdutoControllerBaseActionController
        .startAction(name: '_CadastroProdutoControllerBase.setPreco');
    try {
      return super.setPreco(value);
    } finally {
      _$_CadastroProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUnidade(Unidade unidade) {
    final _$actionInfo = _$_CadastroProdutoControllerBaseActionController
        .startAction(name: '_CadastroProdutoControllerBase.setUnidade');
    try {
      return super.setUnidade(unidade);
    } finally {
      _$_CadastroProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDisponibilidade(bool value, ProdutosModel item) {
    final _$actionInfo =
        _$_CadastroProdutoControllerBaseActionController.startAction(
            name: '_CadastroProdutoControllerBase.changeDisponibilidade');
    try {
      return super.changeDisponibilidade(value, item);
    } finally {
      _$_CadastroProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectProduto: ${selectProduto},
getMeusProdutos: ${getMeusProdutos},
getNomeProduto: ${getNomeProduto},
getIconProduto: ${getIconProduto},
getUnidadeProduto: ${getUnidadeProduto},
getPrecoProduto: ${getPrecoProduto},
getPrice: ${getPrice}
    ''';
  }
}
