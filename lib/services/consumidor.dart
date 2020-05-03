import 'package:cloud_firestore/cloud_firestore.dart';

class ConsumidorService {
  
  ConsumidorService();

  final CollectionReference hortaCollection = Firestore.instance.collection('horta');

  Future<QuerySnapshot> getHortas() async {
    return await this.hortaCollection.getDocuments();    
  }

}