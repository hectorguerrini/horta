import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:horta/models/horta.dart';
import 'package:horta/models/perfil.dart';
import 'package:horta/services/auth.dart';

import 'auth.dart';
class DatabaseService {

  String uid;

  DatabaseService({ this.uid });

  
  final CollectionReference perfilCollection = Firestore.instance.collection('perfil');
  final CollectionReference hortaCollection = Firestore.instance.collection('horta');
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future updateUserPerfil(Perfil perfil) async {
    Map<String, dynamic> _perfil = perfil.toJson();    
    return await perfilCollection.document(uid).setData(_perfil);
  }
  
  Future updateHortaPerfil(Horta horta) async {
    Map<String, dynamic> _horta = horta.toJson();    
    return await hortaCollection.document(uid).setData(_horta);
  }
  
  Future<DocumentSnapshot> getUserPerfil() async {
    return await perfilCollection.document(uid).get();
  }

  Future<DocumentSnapshot> gethortaPerfil() async {
    return await hortaCollection.document(uid).get();
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
}