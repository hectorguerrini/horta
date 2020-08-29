import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horta/app/modules/perfil/models/horta_model.dart';

class MinhaHortaRepository {
  final CollectionReference _collectionReference =
      Firestore.instance.collection('hortas');

  Future<HortaModel> getMinhaHorta(String uid) {
    return _collectionReference.document(uid).get().then((value) => value.exists
        ? (HortaModel.fromJson(value.data)..reference = value.reference)
        : HortaModel());
  }

  Future<DocumentReference> salvarMinhaHorta(
      String uid, HortaModel hortaModel) async {
    if (hortaModel.reference != null) {
      await hortaModel.reference.updateData(hortaModel.toJson());
      return hortaModel.reference;
    } else {
      await _collectionReference
          .document(uid)
          .setData(hortaModel.toJson(), merge: true);
      return _collectionReference.document(uid);
    }
  }
}
