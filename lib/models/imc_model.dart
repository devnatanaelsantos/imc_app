class ImcModel {
  final double peso;
  final double altura;
  final String mensagem;

  ImcModel({
    required this.peso,
    required this.altura,
    required this.mensagem,
  });

  @override
  String toString() {
    return 'Peso: $peso, Altura: $altura, Mensagem: $mensagem';
  }
}
