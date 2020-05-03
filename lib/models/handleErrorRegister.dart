class HandleErrorRegister {
//   ERROR_WEAK_PASSWORD - If the password is not strong enough.
// ERROR_INVALID_EMAIL - If the email address is malformed.
// ERROR_EMAIL_ALREADY_IN_USE - If the email is already in use by a different account.
  String errorMessage;
  HandleErrorRegister(String code) {
    switch (code) {
      case "ERROR_INVALID_EMAIL":
        errorMessage = "Seu email está invalido. (exemplo@email.com)";
        break;
      case "ERROR_WEAK_PASSWORD":
        errorMessage = "Senha Fraca. Insira uma senha mais Forte";
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        errorMessage = "Email já cadastrado. Insira um novo email.";
        break;      
      default:
        errorMessage = "Erro de conexão.";
    }
  }
}