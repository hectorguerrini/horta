enum Unidade { KG, UNIDADE, DUZIA }

extension ParseToString on Unidade {
  String toShortString() {
    return this.toString().split('.').last.toLowerCase();
  }
}
