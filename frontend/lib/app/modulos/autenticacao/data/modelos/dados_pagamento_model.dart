import 'dart:convert';

class DadosPagamentoModel {
  final String numero;
  final String titular;
  final String vencimento;
  final String cvv;

  DadosPagamentoModel({
    required this.numero,
    required this.titular,
    required this.vencimento,
    required this.cvv,
  });

  Map<String, dynamic> toMap() {
    return {
      'numero': numero,
      'titular': titular,
      'vencimento': vencimento,
      'cvv': cvv,
    };
  }

  factory DadosPagamentoModel.fromMap(Map<String, dynamic> map) {
    return DadosPagamentoModel(
      numero: map['numero'],
      titular: map['titular'],
      vencimento: map['vencimento'],
      cvv: map['cvv'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DadosPagamentoModel.fromJson(String source) =>
      DadosPagamentoModel.fromMap(json.decode(source));
}
