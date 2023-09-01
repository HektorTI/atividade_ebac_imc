class IMC {
  final double altura;
  final double peso;
  final String mensagem;

  IMC({required this.peso, required this.altura, required this.mensagem});

  factory IMC.fromjason(Map json) {
    return IMC(
      peso: json['peso'],
      altura: json['altura'],
      mensagem: json['mensagem'],
    );
  }

  @override
  String toString() {
    return 'Peso: $peso, Altura: $altura, Mensagem: $mensagem;';
  }
}
