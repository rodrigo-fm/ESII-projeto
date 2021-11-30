class FiltrosModel {
  final DateTime dataIda;
  final DateTime? dataVolta;
  final String origem;
  final String destino;

  FiltrosModel({
    required this.dataIda,
    this.dataVolta,
    required this.origem,
    required this.destino,
  });
}
