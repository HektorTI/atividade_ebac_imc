class ImcModel {
  final double altura;
  final double peso;
  final String mensagem;

  ImcModel({required this.peso, required this.altura, required this.mensagem});

  factory ImcModel.fromjason(Map json) {
    return ImcModel(
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
