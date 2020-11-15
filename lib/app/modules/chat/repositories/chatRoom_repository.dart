import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horta/app/modules/perfil/models/horta_model.dart';

class ChatRoomRepository {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('hortas');

  Stream<List<HortaModel>> getHortas() {
    return _collectionReference.snapshots().map((event) => event.docs
        .map((e) => HortaModel.fromJson(e.data())..reference = e.reference)
        .toList());
  }
}
