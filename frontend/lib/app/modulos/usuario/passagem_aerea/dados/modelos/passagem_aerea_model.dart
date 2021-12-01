import 'dart:convert';

import 'voo_model.dart';

class PassagemAereaModel {
  final int id;
  final int numeroAssento;
  final String classe;
  final VooModel voo;
  final double preco;

  PassagemAereaModel({
    required this.id,
    required this.numeroAssento,
    required this.classe,
    required this.voo,
    required this.preco,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'numeroAssento': numeroAssento,
      'classe': classe,
      'voo': voo.toMap(),
      'preco': preco,
    };
  }

  factory PassagemAereaModel.fromMap(Map<String, dynamic> map) {
    return PassagemAereaModel(
      id: map['id'],
      numeroAssento: map['numeroAssento'] ?? -1,
      classe: map['classe'],
      voo: VooModel.fromMap(map['voo']),
      preco: map['preco'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PassagemAereaModel.fromJson(String source) =>
      PassagemAereaModel.fromMap(json.decode(source));

  static List<PassagemAereaModel> fromJsonList(String source) {
    final data = json.decode(source) as List<dynamic>;
    List<PassagemAereaModel> resultado = [];
    for (var item in data) {
      resultado.add(PassagemAereaModel.fromMap(item));
    }
    return resultado;
  }
}
