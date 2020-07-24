class HandleErrorLoginCredential {
  String errorMessage;
  HandleErrorLoginCredential(String code) {
    switch (code) {
      case "ERROR_INVALID_CREDENTIAL":
        errorMessage = "Registro expirado ou malformado.";
        break;
      case "ERROR_USER_DISABLED":
        errorMessage = "Usuario desabilitado";
        break;
      case "ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL":
        errorMessage = "Essa conta ja existe por meio de login com google.";
        break;    
      case "ERROR_OPERATION_NOT_ALLOWED":
        errorMessage = "Contas google não habilitadas.";
        break;  
      case "ERROR_INVALID_ACTION_CODE":
        errorMessage = "Erro.";
        break;  
        
      default:
        errorMessage = "Erro de conexão.";
    }
  }

}

