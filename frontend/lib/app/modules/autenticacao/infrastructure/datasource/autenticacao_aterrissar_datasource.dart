import 'dart:async';

import 'package:http/http.dart' as http;

import '../../data/datasources/autenticacao_datasource_interface.dart';

class AutenticacaoAterrissarDatasource implements IAutenticacaoDatasource {
  final String apiURL = '';
  final Duration timeout = const Duration(seconds: 20);

  @override
  Future<http.Response> criarConta(String email, String senha) async {
    try {
      final response = await http.post(
        Uri.parse('$apiURL/criar-conta'),
        headers: {},
        body: {},
      ).timeout(timeout, onTimeout: () {
        throw TimeoutException;
      });

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<http.Response> login(String email, String senha) async {
    try {
      final response = await http.post(
        Uri.parse('$apiURL/login'),
        headers: {},
        body: {
          'email': email,
          'senha': senha,
        },
      ).timeout(timeout, onTimeout: () {
        throw TimeoutException;
      });

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
