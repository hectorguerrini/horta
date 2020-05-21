import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:horta/models/horta.dart';
import 'package:horta/models/perfil.dart';
import 'package:horta/models/user.dart';
import 'package:horta/services/database.dart';
import 'package:horta/services/perfil.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create User object based on firebase user

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null
        ? User(user.uid, user.photoUrl, user.email, user.displayName)
        : null;
  }

//Auth change user Stream

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

//sign in anonymous

  // Future signInAnon() async {
  //   try {
  //     AuthResult result = await _auth.signInAnonymously();
  //     FirebaseUser user = result.user;
  //     return _userFromFirebaseUser(user);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

//sign in email/password

  Future<User> loginWithEmailAndPassword(String email, String senha) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: senha);
      FirebaseUser user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return Future.error(e);
    }
  }

  // facebook login
  Future<void> loginFacebook() async {
    try {
      var facebookLogin = new FacebookLogin();
      var result = await facebookLogin.logIn(['email']);

      if (result.status == FacebookLoginStatus.loggedIn) {
        final AuthCredential credential = FacebookAuthProvider.getCredential(
            accessToken: result.accessToken.token);

        final FirebaseUser user =
            (await FirebaseAuth.instance.signInWithCredential(credential)).user;
        print('logado ' + user.displayName);
        return user;
      }
    } catch (e) {
      print(e.message);
    }
  }

// google login
  Future<void> loginGoogle() async {
    try {
      final GoogleSignIn _googleSignIn =
          GoogleSignIn(scopes: ['email'], hostedDomain: '', clientId: '');
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken, accessToken: googleAuth.idToken);
      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      print("logado " + user.displayName);
      return user;
    } catch (e) {
      print(e.message);
    }
  }
//register with email/password

  Future<User> registerWithEmailAndPassword(
      String nome, String email, String senha) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      FirebaseUser user = result.user;
      UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
      userUpdateInfo.displayName = nome;
      await user.updateProfile(userUpdateInfo);

      Perfil perfil = new Perfil();
      perfil.email = email;
      perfil.nome = nome;
      await PerfilService(uid: user.uid).updateUserPerfil(perfil);

      Horta horta = new Horta();
      await DatabaseService(uid: user.uid).updateHortaPerfil(horta);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return Future.error(e);
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

  Future updateUserPhotoUrl(String photoUrl) async {
    try {
      FirebaseUser user = await _auth.currentUser();
      UserUpdateInfo info = new UserUpdateInfo();
      info.photoUrl = photoUrl;
      info.displayName = 'heavi';
      return await user.updateProfile(info);
    } catch (e) {
      print(e.toStrint());
      return null;
    }
  }

  //Esqueci minha senha
  Future redefinirSenha(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return Future.error(e);
    }
  }
}
