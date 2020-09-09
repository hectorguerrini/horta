import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:horta/app/shared/auth/repositories/auth_reposiroty_interface.dart';

class AuthRepository implements IAuthRepository {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('hortas');

  @override
  User getUser() {
    return _auth.currentUser;
  }

  @override
  Future<User> loginWithEmailAndPassword(String email, String senha) async {
    return (await _auth.signInWithEmailAndPassword(
            email: email, password: senha))
        .user;
  }

  @override
  Future<User> loginWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final User user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  @override
  Future<User> registerWithEmailAndPassword(
      String nome, String email, String senha) async {
    final User user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: senha))
        .user;
    await user.updateProfile(displayName: nome);
    return user;
  }

  @override
  Future<bool> getIsAgricultor(String uid) async {
    return (await _collectionReference.doc(uid).get()).exists;
  }
}
