import 'dart:convert';

import 'passaporte_model.dart';

class DadosPessoaisModel {
  final int id;
  final String cpf;
  final String rg;
  final PassaporteModel? passaporte;

  DadosPessoaisModel({
    required this.id,
    required this.cpf,
    required this.rg,
    this.passaporte,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cpf': cpf,
      'rg': rg,
      'passaporte': passaporte?.toMap(),
    };
  }

  factory DadosPessoaisModel.fromMap(Map<String, dynamic> map) {
    if (map.containsKey('dadosPessoais')) {
      return DadosPessoaisModel(
        id: map['dadosPessoais']['id'],
        cpf: map['dadosPessoais']['cpf'],
        rg: map['dadosPessoais']['rg'],
        passaporte: map['passaporte'] != null
            ? PassaporteModel.fromMap(map['passaporte'])
            : null,
      );
    }
    return DadosPessoaisModel(
      id: map['id'],
      cpf: map['cpf'],
      rg: map['rg'],
      passaporte: map['passaporte'] != null
          ? PassaporteModel.fromMap(map['passaporte'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DadosPessoaisModel.fromJson(String source) =>
      DadosPessoaisModel.fromMap(json.decode(source));
}
