import 'package:firebase_auth/firebase_auth.dart';
import 'package:horta/services/auth.dart';
import 'package:mobx/mobx.dart';
import 'package:horta/models/user_model.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _authService = new AuthService();
  @observable
  UserModel userLogged;

  _AuthControllerBase() {
    getUser();
  }

  @action
  getUser() async {
    FirebaseUser user = await _auth.currentUser();
    userLogged = _userFromFirebaseUser(user);
  }

  @action
  Future login(String email, String senha) async {
    userLogged = await _authService.loginWithEmailAndPassword(email, senha);
  }

  @action
  UserModel _userFromFirebaseUser(FirebaseUser user) {
    return user != null
        ? UserModel(
            uid: user.uid,
            photoUrl: user.photoUrl,
            email: user.email,
            displayName: user.displayName)
        : null;
  }

  @computed
  String get photoUrl => userLogged.photoUrl;

  @computed
  String get displayName => userLogged.displayName;

  @computed
  String get email => userLogged.email;
}
