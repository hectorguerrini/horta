
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'models/register_model.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {

  @observable
  RegisterModel registerModel;

  @observable
  FirebaseAuth _auth = FirebaseAuth.instance;


  @action
  setNome(String value) => registerModel = registerModel.copyWith(nome: value);

  @action
  setUser(String value) => registerModel = registerModel.copyWith(user: value);

  @action
  setSenha(String value) => registerModel = registerModel.copyWith(senha: value);

  @action
  registerWithEmailAndPassword() async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: registerModel.user, password: registerModel.senha);
      FirebaseUser user = result.user;
  }
      
}
