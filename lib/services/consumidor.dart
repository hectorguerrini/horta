import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horta/models/horta_model.dart';
import 'package:horta/models/produtos_model.dart';

class ConsumidorService {
  ConsumidorService();

  final CollectionReference hortaCollection =
      Firestore.instance.collection('horta');
  final CollectionReference meusProdutosCollection =
      Firestore.instance.collection('meusProdutos');
  Stream<List<HortaModel>> getHortas() {
    return hortaCollection.snapshots().map((event) {
      return event.documents.map((e) {
        return HortaModel.fromJson(e.data, e.reference);
      }).toList();
    });
  }

  Future<List<ProdutosModel>> getListaProdutosHorta(String uid) {
    return meusProdutosCollection
        .document(uid)
        .collection('listaProdutos')
        .getDocuments()
        .then((value) {
      return value.documents
          .map((e) => ProdutosModel.fromJson(e.data, e.reference))
          .toList();
    });
  }
}
