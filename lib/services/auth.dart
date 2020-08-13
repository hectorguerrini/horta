import 'package:firebase_auth/firebase_auth.dart';
import 'package:horta/models/horta_model.dart';
import 'package:horta/models/perfil_model.dart';
import 'package:horta/models/user_model.dart';
import 'package:horta/services/perfil.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> loginWithEmailAndPassword(
      String email, String senha) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: senha);
      FirebaseUser user = result.user;

      return UserModel(
          uid: user.uid,
          photoUrl: user.photoUrl,
          email: user.email,
          displayName: user.displayName);
    } catch (e) {
      print(e.toString());
      return Future.error(e);
    }
  }

//register with email/password

  Future<UserModel> registerWithEmailAndPassword(
      String nome, String email, String senha) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      FirebaseUser user = result.user;
      UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
      userUpdateInfo.displayName = nome;
      await user.updateProfile(userUpdateInfo);

      PerfilModel perfil = new PerfilModel(nome: nome, email: email);
      await PerfilService(uid: user.uid).updateUserPerfil(perfil);

      HortaModel horta = new HortaModel();
      await PerfilService(uid: user.uid).updateHortaPerfil(horta);

      return UserModel(
          uid: user.uid,
          photoUrl: user.photoUrl,
          email: user.email,
          displayName: user.displayName);
    } catch (e) {
      print(e.toString());
      return Future.error(e);
    }
  }

//facebook
  // Future<void> loginFacebook() async {
  //   try {
  //     var facebookLogin = new FacebookLogin();
  //     var result = await facebookLogin.logIn(['email']);
  //     if (result.status == FacebookLoginStatus.loggedIn) {
  //       final AuthCredential credential = FacebookAuthProvider.getCredential(
  //           accessToken: result.accessToken.token);
  //       final FirebaseUser user =
  //           (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  //       return user;
  //     }
  //   } catch (e) {
  //     print(e.message);
  //   }
  // }

//google
  Future loginGoogle() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken, accessToken: googleAuth.idToken);
      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      return user;
    } catch (e) {
      print(e.message);
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
      return await user.updateProfile(info);
    } catch (e) {
      print(e.toStrint());
      return null;
    }
  }
}
