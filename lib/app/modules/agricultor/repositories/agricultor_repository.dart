import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/agricultor/models/produtos_model.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';

class AgricultorRepository {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('hortas');

  final AuthController _authController = Modular.get();

  AgricultorRepository();

  Future<DocumentReference> updateMeusProdutos(ProdutosModel produtos) async {
    if (produtos.reference != null) {
      await produtos.reference.update(produtos.toJson());
      return produtos.reference;
    } else {
      return await _collectionReference
          .doc(_authController.user.uid)
          .collection('listaProdutos')
          .add(produtos.toJson());
    }
  }

  Stream<List<ProdutosModel>> getMeusProdutos() {
    return _collectionReference
        .doc(_authController.user.uid)
        .collection('listaProdutos')
        .orderBy('produto')
        .snapshots()
        .map((event) => event.docs
            .map((e) =>
                ProdutosModel.fromJson(e.data())..reference = e.reference)
            .toList());
  }
}
