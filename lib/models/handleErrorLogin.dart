class HandleErrorLogin {
//   ERROR_INVALID_EMAIL - If the email address is malformed.
// ERROR_WRONG_PASSWORD - If the password is wrong.
// ERROR_USER_NOT_FOUND - If there is no user corresponding to the given email address, or if the user has been deleted.
// ERROR_USER_DISABLED - If the user has been disabled (for example, in the Firebase console)
// ERROR_TOO_MANY_REQUESTS - If there was too many attempts to sign in as this user.
// ERROR_OPERATION_NOT_ALLOWED - Indicates that Email & Password accounts are not enabled.
  String errorMessage;
  HandleErrorLogin(String code) {
    switch (code) {
      case "ERROR_INVALID_EMAIL":
        errorMessage = "Seu email está invalido. (exemplo@email.com)";
        break;
      case "ERROR_WRONG_PASSWORD":
        errorMessage = "Sua senha está incorreta. Tente novamente";
        break;
      case "ERROR_USER_NOT_FOUND":
        errorMessage = "Email não cadastrado. Insira um email cadastrado ou se registre.";
        break;      
      default:
        errorMessage = "Erro de conexão.";
    }
  }

}