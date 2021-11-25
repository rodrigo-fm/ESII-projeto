import 'dart:convert';

import 'token_model.dart';

class UsuarioModel {
  final int id;
  final String email;
  final TokenModel token;

  UsuarioModel({
    required this.id,
    required this.email,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'token': token.toMap(),
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'],
      email: map['email'],
      token: TokenModel.fromMap(map['token']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source));
}
