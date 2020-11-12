import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  User getUser();
  Future<User> loginWithEmailAndPassword(String email, String senha);
  Future<User> registerWithEmailAndPassword(
      String nome, String email, String senha);
  Future<User> loginWithGoogle();
  Future logout();
  Future<bool> getIsAgricultor(String uid);
}
