import 'dart:convert';

class TokenModel {
  final String valor;
  final DateTime dataExpiracao;

  TokenModel({
    required this.valor,
    required this.dataExpiracao,
  });

  Map<String, dynamic> toMap() {
    return {
      'valor': valor,
      'dataExpiracao': dataExpiracao.toIso8601String(),
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      valor: map['valor'],
      dataExpiracao: DateTime.parse(map['dataExpiracao']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) =>
      TokenModel.fromMap(json.decode(source));
}
