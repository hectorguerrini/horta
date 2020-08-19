// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroProdutoController on _CadastroProdutoControllerBase, Store {
  Computed<String> _$nomeProdutoComputed;

  @override
  String get nomeProduto =>
      (_$nomeProdutoComputed ??= Computed<String>(() => super.nomeProduto,
              name: '_CadastroProdutoControllerBase.nomeProduto'))
          .value;
  Computed<String> _$iconProdutoComputed;

  @override
  String get iconProduto =>
      (_$iconProdutoComputed ??= Computed<String>(() => super.iconProduto,
              name: '_CadastroProdutoControllerBase.iconProduto'))
          .value;
  Computed<String> _$unidadeProdutoComputed;

  @override
  String get unidadeProduto =>
      (_$unidadeProdutoComputed ??= Computed<String>(() => super.unidadeProduto,
              name: '_CadastroProdutoControllerBase.unidadeProduto'))
          .value;
  Computed<double> _$precoProdutoComputed;

  @override
  double get precoProduto =>
      (_$precoProdutoComputed ??= Computed<double>(() => super.precoProduto,
              name: '_CadastroProdutoControllerBase.precoProduto'))
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

  @override
  String toString() {
    return '''
selectProduto: ${selectProduto},
nomeProduto: ${nomeProduto},
iconProduto: ${iconProduto},
unidadeProduto: ${unidadeProduto},
precoProduto: ${precoProduto}
    ''';
  }
}
