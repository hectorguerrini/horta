import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:horta/models/horta_model.dart';
import 'package:horta/models/perfil_model.dart';
import 'package:horta/services/auth.dart';

class PerfilService {
  String uid;
  PerfilService({this.uid});

  final FirebaseStorage storage = FirebaseStorage.instance;
  final CollectionReference perfilCollection =
      Firestore.instance.collection('perfil');

  final CollectionReference hortaCollection =
      Firestore.instance.collection('horta');

  // Perfil consumidor/agricultor
  Future updateUserPerfil(PerfilModel perfil) async {
    return await perfil.reference.updateData(perfil.toJson());
  }

  Future<PerfilModel> getUserPerfil() async {
    return await perfilCollection
        .document(uid)
        .get()
        .then((value) => PerfilModel.fromJson(value.data, value.reference));
  }

  Future updatePhoto(File image) async {
    try {
      String urlImage;
      String fileName = uid + '_photoPerfil.jpg';
      StorageReference imageRef = storage.ref().child(fileName);
      StorageUploadTask uploadTask = imageRef.putFile(image);
      await uploadTask.onComplete;
      await imageRef.getDownloadURL().then((url) {
        urlImage = url;
      }).catchError((onError) {
        print(onError.toString());
        urlImage = null;
      });
      await AuthService().updateUserPhotoUrl(urlImage);
      return;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Horta
  Future updateHortaPerfil(HortaModel horta) async {
    return await horta.reference.updateData(horta.toJson());
  }

  Future<HortaModel> gethortaPerfil() async {
    return await hortaCollection
        .document(uid)
        .get()
        .then((value) => HortaModel.fromJson(value.data, value.reference));
  }
}
