import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:horta/models/produtos_model.dart';
import 'package:horta/services/produtos.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'menuAgricultor_controller.g.dart';

class MenuAgricultorController = _MenuAgricultorControllerBase
    with _$MenuAgricultorController;

abstract class _MenuAgricultorControllerBase with Store {
  final ProdutosService _produtosService;
  NumberFormat currency = new NumberFormat.currency(
      locale: "pt_BR", decimalDigits: 2, symbol: "R\$");

  final precoProdutoCtrl = new MoneyMaskedTextController(
      decimalSeparator: ",", thousandSeparator: ".", leftSymbol: "R\$ ");
  @observable
  ObservableStream<List<ProdutosModel>> listaProdutos;

  @observable
  ProdutosModel selectProduto;

  @observable
  List<ProdutosModel> comboProdutos = [];

  _MenuAgricultorControllerBase(this._produtosService) {
    selectProduto = new ProdutosModel(disponibilidade: false);
    getMeusProdutos();
    getComboProdutos();
  }

  @action
  getMeusProdutos() {
    listaProdutos = _produtosService.getMeusProdutos().asObservable();
  }

  @action
  getComboProdutos() async {
    comboProdutos = await _produtosService.comboProdutos();
  }

  @action
  setProduto(String nmProduto) {
    selectProduto = selectProduto.copyWith(
        produto: nmProduto,
        icon: comboProdutos
            .firstWhere((element) => element.produto == nmProduto)
            .icon);
  }

  @action
  setPreco(String value) => selectProduto =
      selectProduto.copyWith(preco: precoProdutoCtrl.numberValue);
  @action
  setUnidade(String unidade) =>
      selectProduto = selectProduto.copyWith(unidade: unidade);

  @action
  changeDisponibilidade(bool value, ProdutosModel item) {
    item = item.copyWith(disponibilidade: value);
    item.reference.updateData(item.toJson());
  }

  @computed
  String get nomeProduto => selectProduto.produto;
  @computed
  String get iconProduto => selectProduto.icon;
  @computed
  String get unidadeProduto => selectProduto.unidade;
  @computed
  double get precoProduto => selectProduto.preco;

  @action
  editProduto(ProdutosModel _produto) {
    selectProduto = _produto;
    precoProdutoCtrl.text = _produto.preco.toString();
  }

  @action
  salvar() async {
    if (selectProduto.reference == null) {
      selectProduto.reference =
          await _produtosService.updateMeusProdutos(selectProduto);
    } else {
      selectProduto.reference.updateData(selectProduto.toJson());
    }
  }
}
