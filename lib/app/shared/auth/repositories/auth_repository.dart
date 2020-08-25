import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:horta/app/shared/auth/repositories/auth_reposiroty_interface.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

  @override
  Future<FirebaseUser> loginWithEmailAndPassword(
      String email, String senha) async {
    return (await _auth.signInWithEmailAndPassword(
            email: email, password: senha))
        .user;
  }

  @override
  Future<FirebaseUser> loginWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  @override
  Future<FirebaseUser> registerWithEmailAndPassword(
      String nome, String email, String senha) async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: senha))
        .user;
    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    userUpdateInfo.displayName = nome;
    await user.updateProfile(userUpdateInfo);
    return user;
  }
}
