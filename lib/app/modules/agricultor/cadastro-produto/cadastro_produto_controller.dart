import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/agricultor/models/produtos_model.dart';
import 'package:horta/app/modules/agricultor/repositories/agricultor_repository.dart';
import 'package:mobx/mobx.dart';
part 'cadastro_produto_controller.g.dart';

class CadastroProdutoController = _CadastroProdutoControllerBase
    with _$CadastroProdutoController;

abstract class _CadastroProdutoControllerBase with Store {
  final AgricultorRepository _repository = Modular.get();

  @observable
  ProdutosModel selectProduto;

  @computed
  String get nomeProduto => selectProduto.produto;
  @computed
  String get iconProduto => selectProduto.icon;
  @computed
  String get unidadeProduto => selectProduto.unidade;
  @computed
  double get precoProduto => selectProduto.preco;
}
