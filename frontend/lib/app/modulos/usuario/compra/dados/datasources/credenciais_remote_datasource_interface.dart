import 'package:http/http.dart' as http;

import '../../../../autenticacao/data/modelos/dados_pagamento_model.dart';
import '../../../../autenticacao/data/modelos/dados_pessoais_model.dart';

abstract class ICredenciaisRemoteDatasource {
  Future<http.Response> getDadosPessoais(int idUsuario);
  Future<http.Response> getDadosPagamento(int idUsuario);
  Future<http.Response> salvarDadosPessoais(
    int idUsuario,
    DadosPessoaisModel dadosPessoais,
  );
  Future<http.Response> salvarDadosPagamento(
    int idUsuario,
    DadosPagamentoModel dadosPagamento,
  );
  Future<http.Response> removerDadosPessoais(int idUsuario);
  Future<http.Response> removerDadosPagamento(int idCartaoDeCredito);
}
