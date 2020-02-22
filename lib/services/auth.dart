import 'package:firebase_auth/firebase_auth.dart';
import 'package:horta/models/perfil.dart';
import 'package:horta/models/user.dart';
import 'package:horta/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create User object based on firebase user

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//Auth change user Stream

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

//sign in anonymous

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign in email/password

  Future loginWithEmailAndPassword(String email, String senha) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: senha);
      FirebaseUser user = result.user;
          
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


//register with email/password

  Future registerWithEmailAndPassword(String email, String senha) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      FirebaseUser user = result.user;

      Perfil perfil = new Perfil();
      perfil.email = email;
      await DatabaseService(uid: user.uid).updateUserPerfil(perfil);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//signout
  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future updateUserInfo(String displayName, String photoUrl) async {
    try {
      FirebaseUser user = await _auth.currentUser();
      UserUpdateInfo info = new UserUpdateInfo();
      info.displayName = displayName;
      info.photoUrl = photoUrl;      
      return user.updateProfile(info);
    } catch (e) {
      print(e.toStrint());
      return null;
    }
  }
}
