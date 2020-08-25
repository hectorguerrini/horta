enum Hortalicas {
  ALFACE,
  BATATA,
  BETERRABA,
  BROCOLIS,
  CENOURA,
  COUVE_FLOR,
  GENGIBRE,
  TOMATE,
  SALSINHA
}

extension ParseToString on Hortalicas {
  String toShortString() {
    var cap = this.toString().split('.').last.replaceAll('_', ' ');
    return "${cap[0]}${cap.substring(1).toLowerCase()}";
  }
}
