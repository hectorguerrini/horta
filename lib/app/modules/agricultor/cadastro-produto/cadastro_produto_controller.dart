import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/enumeration/hortalicas_enum.dart';
import 'package:horta/app/enumeration/unidade_enum.dart';
import 'package:horta/app/modules/agricultor/agricultor_controller.dart';
import 'package:horta/app/modules/agricultor/models/produtos_model.dart';
import 'package:horta/app/modules/agricultor/repositories/agricultor_repository.dart';
import 'package:horta/app/shared/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'cadastro_produto_controller.g.dart';

class CadastroProdutoController = _CadastroProdutoControllerBase
    with _$CadastroProdutoController;

abstract class _CadastroProdutoControllerBase with Store {
  final AgricultorRepository _repository = Modular.get();
  final AgricultorController _controller = Modular.get();
  final MoneyMaskedTextController precoProdutoCtrl =
      new MoneyMaskedTextController(
          decimalSeparator: ",", thousandSeparator: ".", leftSymbol: "R\$ ");
  final NumberFormat currency = new NumberFormat.currency(
      locale: "pt_BR", decimalDigits: 2, symbol: "R\$");

  @observable
  ProdutosModel selectProduto;

  _CadastroProdutoControllerBase() {
    if (Modular.args.data != null) {
      selectProduto = Modular.args.data;
      precoProdutoCtrl.text = selectProduto.preco.toString();
    } else {
      selectProduto = new ProdutosModel();
    }
  }
  @computed
  List<ProdutosModel> get getMeusProdutos => _controller.listaProdutos.data;

  @computed
  Hortalicas get getNomeProduto => selectProduto.produto;
  @computed
  String get getIconProduto => ICON_HORTALICAS[selectProduto.produto];
  @computed
  Unidade get getUnidadeProduto => selectProduto.unidade;
  @computed
  double get getPrecoProduto => selectProduto.preco;

  @computed
  String get getPrice =>
      "${currency.format(getPrecoProduto)} por ${getUnidadeProduto?.toShortString() ?? ''}";

  @action
  setProduto(Hortalicas value) =>
      selectProduto = selectProduto.copyWith(produto: value);

  @action
  setPreco(String value) => selectProduto =
      selectProduto.copyWith(preco: precoProdutoCtrl.numberValue);
  @action
  setUnidade(Unidade unidade) =>
      selectProduto = selectProduto.copyWith(unidade: unidade);

  @action
  changeDisponibilidade(bool value, ProdutosModel item) {
    item = item.copyWith(disponibilidade: value);
    item.reference.update(item.toJson());
  }

  @action
  salvar() async {
    try {
      await _repository.updateMeusProdutos(selectProduto);
      selectProduto = new ProdutosModel();
    } catch (e) {
      print(e);
    }
  }
}
