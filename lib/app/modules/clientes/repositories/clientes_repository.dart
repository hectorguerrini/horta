import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';

class ClientesRepository extends Disposable {
  final DioForNative client;

  ClientesRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
