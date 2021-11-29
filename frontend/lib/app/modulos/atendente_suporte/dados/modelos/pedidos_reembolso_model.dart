import 'dart:convert';

abstract class PedidosReembolsoModel {
  final int id;
  final bool aprovado;
  final DateTime dataAbertura;
  final String motivoSolicitacao;
  final String motivoRecusa;
  //final CompraModel detalhesCompra;

  PedidosReembolsoModel({
    required this.id,
    required this.aprovado,
    required this.dataAbertura,
    required this.motivoRecusa,
    required this.motivoSolicitacao,
    //required this.detalhesCompra,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'aprovado': aprovado,
      'dataAbertura': dataAbertura,
      'motivoSolicitacao': motivoSolicitacao,
      'motivoRecusa': motivoRecusa,
    };
  }

  /*factory PedidoReembolsoModel.fromMap(Map<String, dynamic> map) {
    return PedidoReembolsoModel(
      id: map['id'],
      aprovado: map['aprovado'],
      dataAbertura: map['dataAbertura'],
      motivoSolicitacao: map['motivoSolicitacao'],
      motivoRecusa: map['motivoRecusa'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PedidoReembolsoModel.fromJson(String source) =>
      PedidoReembolsoModel.fromMap(json.decode(source));

  static List<PedidoReembolsoModel> fromJsonList(String source) {
    final data = json.decode(source) as List<dynamic>;
    List<PedidoReembolsoModel> resultado = [];
    for (var item in data) {
      resultado.add(PedidoReembolsoModel.fromMap(item));
    }
    return resultado;
  }*/
}
