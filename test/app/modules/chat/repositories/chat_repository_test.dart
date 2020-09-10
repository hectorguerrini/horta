import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:horta/app/modules/chat/repositories/chat_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  ChatRepository repository;
  // MockClient client;

  setUp(() {
    // repository = ChatRepository();
    // client = MockClient();
  });

  group('ChatRepository Test', () {
    //  test("First Test", () {
    //    expect(repository, isInstanceOf<ChatRepository>());
    //  });

    test('returns a Post if the http call completes successfully', () async {
      //    when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
      //        .thenAnswer((_) async =>
      //            Response(data: {'title': 'Test'}, statusCode: 200));
      //    Map<String, dynamic> data = await repository.fetchPost(client);
      //    expect(data['title'], 'Test');
    });
  });
}
