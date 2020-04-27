import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:horta/models/perfil.dart';
import 'package:horta/services/auth.dart';

class PerfilService {
  String uid;
  PerfilService({this.uid});

  final FirebaseStorage storage = FirebaseStorage.instance;
  final CollectionReference perfilCollection = Firestore.instance.collection('perfil');

  Future updateUserPerfil(Perfil perfil) async{
    return await this.perfilCollection.document(uid).setData(perfil.toJson(), merge: true);
  }
  
  Future<DocumentSnapshot> getUserPerfil() async {
    return await perfilCollection.document(uid).get();
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