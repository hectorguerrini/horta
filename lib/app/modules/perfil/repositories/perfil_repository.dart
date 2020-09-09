import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/perfil/models/horta_model.dart';
import 'package:horta/app/modules/perfil/models/perfil_model.dart';

class PerfilRepository {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('perfil');

  Future<PerfilModel> getPerfil(String uid) {
    return _collectionReference.doc(uid).get().then((value) => value.exists
        ? (PerfilModel.fromJson(value.data())..reference = value.reference)
        : PerfilModel());
  }

  Future<DocumentReference> salvarPerfil(
      String uid, PerfilModel perfilModel) async {
    if (perfilModel.reference != null) {
      await perfilModel.reference.update(perfilModel.toJson());
      return perfilModel.reference;
    } else {
      await _collectionReference.doc(uid).set(perfilModel.toJson());
      return _collectionReference.doc(uid);
    }
  }

  Future updatePerfil(User user, {String displayName, String photoUrl}) async {
    return await user.updateProfile(
        displayName: displayName, photoURL: photoUrl);
  }
}
