import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horta/models/horta_model.dart';

class ConsumidorService {
  ConsumidorService();

  final CollectionReference hortaCollection =
      Firestore.instance.collection('horta');

  Stream<List<HortaModel>> getHortas() {
    return hortaCollection.snapshots().map((event) {
      return event.documents.map((e) {
        return HortaModel.fromJson(e.data, e.reference);
      }).toList();
    });
  }
}
