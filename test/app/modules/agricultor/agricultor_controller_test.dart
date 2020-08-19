import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:horta/app/modules/agricultor/agricultor_controller.dart';
import 'package:horta/app/modules/agricultor/agricultor_module.dart';

void main() {
  initModule(AgricultorModule());
  // AgricultorController agricultor;
  //
  setUp(() {
    //     agricultor = AgricultorModule.to.get<AgricultorController>();
  });

  group('AgricultorController Test', () {
    //   test("First Test", () {
    //     expect(agricultor, isInstanceOf<AgricultorController>());
    //   });

    //   test("Set Value", () {
    //     expect(agricultor.value, equals(0));
    //     agricultor.increment();
    //     expect(agricultor.value, equals(1));
    //   });
  });
}
