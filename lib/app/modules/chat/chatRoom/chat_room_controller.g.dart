// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatRoomController on _ChatRoomControllerBase, Store {
  final _$listaHortasAtom = Atom(name: '_ChatRoomControllerBase.listaHortas');

  @override
  ObservableStream<List<HortaModel>> get listaHortas {
    _$listaHortasAtom.reportRead();
    return super.listaHortas;
  }

  @override
  set listaHortas(ObservableStream<List<HortaModel>> value) {
    _$listaHortasAtom.reportWrite(value, super.listaHortas, () {
      super.listaHortas = value;
    });
  }

  final _$_ChatRoomControllerBaseActionController =
      ActionController(name: '_ChatRoomControllerBase');

  @override
  dynamic getHortas() {
    final _$actionInfo = _$_ChatRoomControllerBaseActionController.startAction(
        name: '_ChatRoomControllerBase.getHortas');
    try {
      return super.getHortas();
    } finally {
      _$_ChatRoomControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaHortas: ${listaHortas}
    ''';
  }
}
