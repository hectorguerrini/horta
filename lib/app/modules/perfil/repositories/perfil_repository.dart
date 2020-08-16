import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/perfil/models/perfil_model.dart';

class PerfilRepository {
  final CollectionReference _collectionReference =
      Firestore.instance.collection('perfil');

  Future<PerfilModel> getPerfil(String uid) {
    return _collectionReference.document(uid).get().then((value) => value.exists
        ? (PerfilModel.fromJson(value.data)..reference = value.reference)
        : PerfilModel());
  }

  Future<DocumentReference> salvarPerfil(PerfilModel perfilModel) async {
    if (perfilModel.reference != null) {
      await perfilModel.reference.updateData(perfilModel.toJson());
      return perfilModel.reference;
    } else {
      return await _collectionReference.add(perfilModel.toJson());
    }
  }
}
