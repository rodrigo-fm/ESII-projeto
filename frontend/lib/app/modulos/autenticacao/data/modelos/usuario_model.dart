import 'dart:convert';

import 'token_model.dart';

class UsuarioModel {
  final int id;
  final String nome;
  final String email;
  final String tipoUsuario;
  final TokenModel token;

  UsuarioModel({
    required this.id,
    required this.nome,
    required this.tipoUsuario,
    required this.email,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'tipoUsuario': tipoUsuario,
      'email': email,
      'token': token.toMap(),
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'],
      nome: map['nome'],
      tipoUsuario: map['tipoUsuario'],
      email: map['email'],
      token: TokenModel.fromMap(map['token']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source));
}