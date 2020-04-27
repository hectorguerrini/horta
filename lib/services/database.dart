import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horta/models/horta.dart';

class DatabaseService {

  String uid;

  DatabaseService({ this.uid });

  

  final CollectionReference hortaCollection = Firestore.instance.collection('horta');


  Future updateHortaPerfil(Horta horta) async {
    Map<String, dynamic> _horta = horta.toJson();    
    return await hortaCollection.document(uid).setData(_horta);
  }
  
  
  Future<DocumentSnapshot> gethortaPerfil() async {
    return await hortaCollection.document(uid).get();
  }


}