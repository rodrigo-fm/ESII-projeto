import 'dart:convert';

class PedidoReembolsoModel {
  final int id;
  final bool? aprovado;
  final DateTime dataAbertura;
  final String motivoSolicitacao;
  final String? motivoRecusa;

  PedidoReembolsoModel({
    required this.id,
    this.aprovado,
    required this.dataAbertura,
    this.motivoRecusa,
    required this.motivoSolicitacao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'aprovado': aprovado,
      'dataAbertura': dataAbertura.toIso8601String(),
      'motivoSolicitacao': motivoSolicitacao,
      'motivoRecusa': motivoRecusa,
    };
  }

  factory PedidoReembolsoModel.fromMap(Map<String, dynamic> map) {
    return PedidoReembolsoModel(
      id: map['id'],
      aprovado: map['aprovado'],
      dataAbertura: DateTime.parse(map['dataAbertura']),
      motivoSolicitacao: map['motivoSolicitacao'],
      motivoRecusa: map['motivoRecusa'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PedidoReembolsoModel.fromJson(String source) =>
      PedidoReembolsoModel.fromMap(json.decode(source));
}
