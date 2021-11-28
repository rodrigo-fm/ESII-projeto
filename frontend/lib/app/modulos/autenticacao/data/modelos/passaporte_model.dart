import 'dart:convert';

class PassaporteModel {
  final String numero;
  final DateTime dataEmissao;

  PassaporteModel({
    required this.numero,
    required this.dataEmissao,
  });

  Map<String, dynamic> toMap() {
    return {
      'numero': numero,
      'dataEmissao': dataEmissao.toIso8601String(),
    };
  }

  factory PassaporteModel.fromMap(Map<String, dynamic> map) {
    return PassaporteModel(
      numero: map['numero'],
      dataEmissao: DateTime.parse(map['dataEmissao']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PassaporteModel.fromJson(String source) =>
      PassaporteModel.fromMap(json.decode(source));
}
