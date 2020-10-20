import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'chat_room_controller.g.dart';

@Injectable()
class ChatRoomController = _ChatRoomControllerBase with _$ChatRoomController;

abstract class _ChatRoomControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
