import 'dart:convert';

import 'package:aterrissar/app/modulos/autenticacao/data/modelos/dados_pagamento_model.dart';
import 'package:aterrissar/app/modulos/autenticacao/data/modelos/dados_pessoais_model.dart';
import 'package:http/http.dart' as http;

import '../credenciais_remote_datasource_interface.dart';

class CredenciaisHerokuRemoteDatasource
    implements ICredenciaisRemoteDatasource {
  String apiURL = 'https://pacific-ravine-59367.herokuapp.com';

  @override
  Future<http.Response> getDadosPagamento(int idUsuario) async {
    final response = await http.get(
      Uri.parse('$apiURL/cartao-de-credito/usuario/$idUsuario'),
    );

    return response;
  }

  @override
  Future<http.Response> getDadosPessoais(int idDadosPessoais) async {
    final response = await http.get(
      Uri.parse('$apiURL/dados-pessoais/usuario/$idDadosPessoais'),
    );

    return response;
  }

  @override
  Future<http.Response> removerDadosPagamento(int idUsuario) {
    throw UnimplementedError();
  }

  @override
  Future<http.Response> removerDadosPessoais(int idUsuario) {
    throw UnimplementedError();
  }

  @override
  Future<http.Response> salvarDadosPagamento(
    int idUsuario,
    DadosPagamentoModel dadosPagamento,
  ) async {
    final response = await http.post(
      Uri.parse('$apiURL/cartao-de-credito/usuario/$idUsuario'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'bandeira': 'Visa',
        'nomeTitular': dadosPagamento.titular,
        'numeroCartao': dadosPagamento.numero,
        'validade': dadosPagamento.vencimento,
      }),
    );

    return response;
  }

  @override
  Future<http.Response> salvarDadosPessoais(
    int idUsuario,
    DadosPessoaisModel dadosPessoais,
  ) async {
    final response = await http.post(
      Uri.parse('$apiURL/dados-pessoais/usuario/$idUsuario'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'cpf': dadosPessoais.cpf,
        'rg': dadosPessoais.rg,
      }),
    );

    return response;
  }
}
