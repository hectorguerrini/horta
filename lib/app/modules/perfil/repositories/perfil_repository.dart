import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/perfil/models/horta_model.dart';
import 'package:horta/app/modules/perfil/models/perfil_model.dart';

class PerfilRepository {
  final CollectionReference _collectionReference =
      Firestore.instance.collection('perfil');

  Future<PerfilModel> getPerfil(String uid) {
    return _collectionReference.document(uid).get().then((value) => value.exists
        ? (PerfilModel.fromJson(value.data)..reference = value.reference)
        : PerfilModel());
  }

  Future<DocumentReference> salvarPerfil(
      String uid, PerfilModel perfilModel) async {
    if (perfilModel.reference != null) {
      await perfilModel.reference.updateData(perfilModel.toJson());
      return perfilModel.reference;
    } else {
      await _collectionReference
          .document(uid)
          .setData(perfilModel.toJson(), merge: true);
      return _collectionReference.document(uid);
    }
  }

  Future updatePerfil(FirebaseUser user,
      {String displayName, String photoUrl}) async {
    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    userUpdateInfo.displayName = displayName;
    userUpdateInfo.photoUrl = photoUrl;

    return await user.updateProfile(userUpdateInfo);
  }
}
