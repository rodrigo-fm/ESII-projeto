import 'dart:convert';

import '../../modelos/token_model.dart';
import '../../modelos/usuario_model.dart';
import '../autenticacao_remote_datasource_interface.dart';

import 'package:http/http.dart' as http;

class AutenticacaoHerokuRemoteDatasource
    implements IAutenticacaoRemoteDatasource {
  String apiURL = 'https://pacific-ravine-59367.herokuapp.com';

  @override
  Future<http.Response> criarConta(
    String nome,
    String email,
    String senha,
  ) async {
    return await http.post(
      Uri.parse('$apiURL/usuario'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'nomeCompleto': nome,
        'email': email,
        'tipoUsuario': 'usuario',
        'senha': senha,
        'dadosPessoais': null,
      }),
    );
  }

  @override
  Future<http.Response> login(String email, String senha) async {
    return await http.post(
      Uri.parse('$apiURL/usuario/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': email,
        'senha': senha,
      }),
    );
  }
}
