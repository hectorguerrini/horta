import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepository {
  final CollectionReference _collectionReference =
      Firestore.instance.collection('hortas');

  Future<bool> getIsAgricultor(String uid) async {
    return (await _collectionReference.document(uid).get()).exists;
  }
}
