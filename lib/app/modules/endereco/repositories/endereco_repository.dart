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
    if (enderecoModel.reference != null) {
      await enderecoModel.reference.update(enderecoModel.toJson());
    } else {
      await _hortaCollection
          .doc(_authController.user.uid)
          .collection('endereco')
          .add(enderecoModel.toJson());
    }
  }

  Stream<List<EnderecoModel>> getEnderecoHorta() {
    return _hortaCollection
        .doc(_authController.user.uid)
        .collection('endereco')
        .snapshots()
        .map((value) => value.docs
            .map((e) =>
                EnderecoModel.fromJson(e.data())..reference = e.reference)
            .toList());
  }
}
