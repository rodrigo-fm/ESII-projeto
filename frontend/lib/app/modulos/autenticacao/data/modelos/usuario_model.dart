import 'dart:convert';

import 'package:aterrissar/app/modulos/autenticacao/data/modelos/dados_pagamento_model.dart';
import 'package:aterrissar/app/modulos/autenticacao/data/modelos/dados_pessoais_model.dart';

import 'token_model.dart';

class UsuarioModel {
  final int id;
  final String nome;
  final String email;
  final String tipoUsuario;
  final TokenModel token;
  final DadosPessoaisModel? dadosPessoais;
  final DadosPagamentoModel? dadosPagamento;

  UsuarioModel({
    required this.id,
    required this.nome,
    required this.tipoUsuario,
    required this.email,
    required this.token,
    this.dadosPagamento,
    this.dadosPessoais,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'tipoUsuario': tipoUsuario,
      'token': token.toMap(),
      'dadosPessoais': dadosPessoais?.toMap(),
      'dadosPagamento': dadosPagamento?.toMap(),
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      tipoUsuario: map['tipoUsuario'],
      token: TokenModel.fromMap(map['token']),
      dadosPessoais: map['dadosPessoais'] != null
          ? DadosPessoaisModel.fromMap(map['dadosPessoais'])
          : null,
      dadosPagamento: map['dadosPagamento'] != null
          ? DadosPagamentoModel.fromMap(map['dadosPagamento'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source));
}
