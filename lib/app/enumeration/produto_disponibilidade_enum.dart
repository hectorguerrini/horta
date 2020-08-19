enum ProdutoDisponibilidade { DISPONIVEL, INDISPONIVEL }

extension ParseToString on ProdutoDisponibilidade {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
