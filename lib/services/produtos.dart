import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horta/services/database.dart';

class ProdutosService {
    //String uid;

  //ProdutosService({this.uid});
  
  ProdutosService();

  final CollectionReference produtosCollection = Firestore.instance.collection('produtos');


  Future<QuerySnapshot> listaProdutos() async{
    return await produtosCollection.getDocuments();
    
  }

}