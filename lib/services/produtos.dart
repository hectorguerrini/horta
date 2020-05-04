import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horta/models/produtos.dart';
import 'package:horta/services/database.dart';

class ProdutosService {
  String uid;
  ProdutosService({this.uid});


  final CollectionReference produtosCollection = Firestore.instance.collection('produtos');
  final CollectionReference meusProdutosCollection = Firestore.instance.collection('meusProdutos');

  Future<QuerySnapshot> listaProdutos() async {
    return await produtosCollection.getDocuments();
    
  }

  Future updateMeusProdutos(Produtos produtos) async {
    return await this.meusProdutosCollection.document(uid).collection('listaProdutos').add(produtos.toJson());
  }
  Future alterMeusProdutos(ProdutosDocument produtos) async {
    return await this.meusProdutosCollection.document(uid).collection('listaProdutos').document(produtos.uid).updateData(produtos.produtos.toJson());
  }
  Future<QuerySnapshot> getMeusProdutos() async {
    return await this.meusProdutosCollection.document(uid).collection('listaProdutos').getDocuments();
  }

  Future<void> deleteMeusProdutos(String docUID) async {
    return await this.meusProdutosCollection.document(uid).collection('listaProdutos').document(docUID).delete();
  }

}