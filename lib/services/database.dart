import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:horta/models/perfil.dart';
import 'package:horta/services/auth.dart';

import 'auth.dart';
class DatabaseService {

  String uid;

  DatabaseService({ this.uid });


  final CollectionReference perfilCollection = Firestore.instance.collection('perfil');
  final FirebaseStorage storage = FirebaseStorage.instance;
  Future updateUserPerfil(Perfil perfil) async {
    Map<String, dynamic> data = perfil.toJson();
    return await perfilCollection.document(uid).setData(data);
  }

  Future<DocumentSnapshot> getUserPerfil() async {
    return await perfilCollection.document(uid).get();
  }
  Future updatePhoto(File image) async {
    try {
      String urlImage;
      String fileName = basename(image.path);
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
}