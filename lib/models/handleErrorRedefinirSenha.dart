class HandleErrorRedefinirSenha {
//   ERROR_WEAK_PASSWORD - If the password is not strong enough.
// ERROR_INVALID_EMAIL - If the email address is malformed.
// ERROR_EMAIL_ALREADY_IN_USE - If the email is already in use by a different account.
  String errorMessage;
  HandleErrorRedefinirSenha(String code) {
    switch (code) {
      case "ERROR_INVALID_EMAIL":
        errorMessage = "Seu email está invalido. (exemplo@email.com)";
        break;
      case "ERROR_USER_NOT_FOUND":
        errorMessage = "Usuario não encontrado.";
        break;     
      case "ERROR_TOO_MANY_REQUESTS":
        errorMessage = "Seu dispositivo foi temporariamente bloqueado para redefinição de senha. Tente novamente mais tarde.";
        break;
      default:
        errorMessage = "Insira um e-mail válido";
    }
  }
}