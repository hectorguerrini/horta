import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horta/models/produtos_model.dart';

class ProdutosService {
  String uid;
  ProdutosService({this.uid});

  final CollectionReference produtosCollection =
      Firestore.instance.collection('produtos');
  final CollectionReference meusProdutosCollection =
      Firestore.instance.collection('meusProdutos');

  Future<List<ProdutosModel>> comboProdutos() async {
    return await produtosCollection.getDocuments().then((value) => value
        .documents
        .map((e) => ProdutosModel.fromJson(e.data, e.reference))
        .toList());
  }

  Future<DocumentReference> updateMeusProdutos(ProdutosModel produtos) async {
    return await this
        .meusProdutosCollection
        .document(uid)
        .collection('listaProdutos')
        .add(produtos.toJson());
  }

  Stream<List<ProdutosModel>> getMeusProdutos() {
    return meusProdutosCollection
        .document(uid)
        .collection('listaProdutos')
        .snapshots()
        .map((event) => event.documents
            .map((e) => ProdutosModel.fromJson(e.data, e.reference))
            .toList());
  }

  // Future<void> deleteMeusProdutos(String docUID) async {
  //   return await this
  //       .meusProdutosCollection
  //       .document(uid)
  //       .collection('listaProdutos')
  //       .document(docUID)
  //       .delete();
  // }
}
