import 'package:horta/models/horta_model.dart';
import 'package:horta/models/produtos_model.dart';
import 'package:horta/services/consumidor.dart';
import 'package:mobx/mobx.dart';
part 'horta_controller.g.dart';

class HortaController = _HortaControllerBase with _$HortaController;

abstract class _HortaControllerBase with Store {
  final ConsumidorService _consumidorService;

  @observable
  ObservableStream<List<HortaModel>> listaHortas;

  @observable
  HortaModel detalheHorta;

  @observable
  List<ProdutosModel> listaProdutos;
  _HortaControllerBase(this._consumidorService) {
    getListaHortas();
  }

  @action
  getListaHortas() {
    listaHortas = _consumidorService.getHortas().asObservable();
  }

  @action
  getListaProdutos() {
    _consumidorService
        .getListaProdutosHorta(detalheHorta.reference.documentID)
        .then((value) {
      listaProdutos = value;
    });
  }

  @action
  setDetalheHorta(HortaModel value) {
    detalheHorta = value;
    getListaProdutos();
  }

  dispose() {}
}
