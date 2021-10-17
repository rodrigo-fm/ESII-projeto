import 'dart:convert';

class UsuarioModel {
  final int id;
  final String email;

  UsuarioModel({
    required this.id,
    required this.email,
  });

  // usei o plugin chamado "Dart Data Class Generator" do vs code para gerar esses métodos
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) => UsuarioModel.fromMap(json.decode(source));
}
