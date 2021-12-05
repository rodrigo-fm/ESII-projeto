import 'dart:convert';

class DadosPagamentoModel {
  final int id;
  final String numero;
  final String titular;
  final String vencimento;
  final String cvv;

  DadosPagamentoModel({
    required this.id,
    required this.numero,
    required this.titular,
    required this.vencimento,
    required this.cvv,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'numero': numero,
      'titular': titular,
      'vencimento': vencimento,
      'cvv': cvv,
    };
  }

  String get numeroCensurado {
    return numero.substring(12);
  }

  factory DadosPagamentoModel.fromMap(Map<String, dynamic> map) {
    return DadosPagamentoModel(
      id: map['id'],
      numero: map['numeroCartao'],
      titular: map['nomeTitular'],
      vencimento: map['validade'],
      cvv: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DadosPagamentoModel.fromJson(String source) =>
      DadosPagamentoModel.fromMap(json.decode(source));

  static List<DadosPagamentoModel> fromJsonList(String source) {
    final data = json.decode(source) as List<dynamic>;
    List<DadosPagamentoModel> resultado = [];
    for (var item in data) {
      resultado.add(DadosPagamentoModel.fromMap(item));
    }
    return resultado;
  }
}
