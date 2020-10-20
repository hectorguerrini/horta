import 'package:horta/app/modules/chat/repositories/chatRoom_repository.dart';
import 'package:horta/app/modules/perfil/models/horta_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'chat_room_controller.g.dart';

@Injectable()
class ChatRoomController = _ChatRoomControllerBase with _$ChatRoomController;

abstract class _ChatRoomControllerBase with Store {
  final ChatRoomRepository _repository = Modular.get();

  _ChatRoomControllerBase() {
    if (listaHortas == null) {
      getHortas();
    }
  }

  @observable
  ObservableStream<List<HortaModel>> listaHortas;

  @action
  getHortas() {
    listaHortas = _repository.getHortas().asObservable();
  }
}
