import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<FirebaseUser> getUser();
  Future<FirebaseUser> loginWithEmailAndPassword(String email, String senha);
  Future<FirebaseUser> registerWithEmailAndPassword(
      String nome, String email, String senha);
  Future<FirebaseUser> loginWithGoogle();
}
