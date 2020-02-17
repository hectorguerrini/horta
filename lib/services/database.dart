import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:horta/models/perfil.dart';

class DatabaseService {

  String uid;

  DatabaseService({ this.uid });


  final CollectionReference perfilCollection = Firestore.instance.collection('perfil');

  Future updateUserPerfil(Perfil perfil) async {
    Map<String, dynamic> data = perfil.toJson();
    return await perfilCollection.document(uid).setData(data);
  }

  Future<DocumentSnapshot> getUserPerfil() async {
    return await perfilCollection.document(uid).get();
  }
}