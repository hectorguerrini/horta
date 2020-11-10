import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/endereco/model/endereco_model.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';

class EnderecoRepository {
  final CollectionReference _hortaCollection =
      FirebaseFirestore.instance.collection('hortas');
  final AuthController _authController = Modular.get();

  EnderecoRepository();

  Future updateEnderecoHorta(EnderecoModel enderecoModel) async {
    return await _hortaCollection
        .doc(_authController.user.uid)
        .set(enderecoModel.toJson(), SetOptions(merge: true));
  }

  getEnderecoHorta() async {
    _hortaCollection
        .doc(_authController.user.uid)
        .get()
        .then((value) => print(EnderecoModel.fromJson(value.data())));
  }
}
