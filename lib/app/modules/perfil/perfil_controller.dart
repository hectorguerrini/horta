import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/home/home_controller.dart';
import 'package:horta/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';

part 'perfil_controller.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  final AuthController _authController = Modular.get();

  @computed
  String get getUserEmail => _authController.user.email;

  @computed
  String get getUserNome => _authController.user.displayName ?? '';

  @computed
  bool get getIsAgricultor => _authController.isAgricultor;
}
