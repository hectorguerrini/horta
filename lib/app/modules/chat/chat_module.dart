import 'chat_controller.dart';
import 'repositories/chat_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'chat_page.dart';

class ChatModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChatController()),
        Bind((i) => ChatRepository(Dio())),
        Bind((i) => ChatModule())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ChatPage()),
      ];

  static Inject get to => Inject<ChatModule>.of();
}
