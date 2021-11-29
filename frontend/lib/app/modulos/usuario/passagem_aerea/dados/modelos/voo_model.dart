import 'dart:convert';

class VooModel {
  final int id;
  final int duracao;
  final String origem;
  final String destino;
  final DateTime dataPartida;
  final String companhiaAerea;

  VooModel({
    required this.id,
    required this.duracao,
    required this.origem,
    required this.destino,
    required this.dataPartida,
    required this.companhiaAerea,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'duracao': duracao,
      'origem': origem,
      'destino': destino,
      'dataPartida': dataPartida.millisecondsSinceEpoch,
      'companhiaAerea': companhiaAerea,
    };
  }

  factory VooModel.fromMap(Map<String, dynamic> map) {
    return VooModel(
      id: map['id'],
      companhiaAerea: map['companhiaAerea'],
      duracao: map['duracao'],
      origem: map['origem'],
      destino: map['destino'],
      dataPartida:
          DateTime.fromMillisecondsSinceEpoch(map['dataPartida'], isUtc: true),
    );
  }

  String toJson() => json.encode(toMap());

  factory VooModel.fromJson(String source) =>
      VooModel.fromMap(json.decode(source));
}
