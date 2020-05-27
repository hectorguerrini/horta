import 'package:horta/models/horta_model.dart';
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

  _HortaControllerBase(this._consumidorService) {
    getListaHortas();
  }

  @action
  getListaHortas() {
    listaHortas = _consumidorService.getHortas().asObservable();
  }

  @action
  setDetalheHorta(HortaModel value) => detalheHorta = value;

  dispose() {}
}
