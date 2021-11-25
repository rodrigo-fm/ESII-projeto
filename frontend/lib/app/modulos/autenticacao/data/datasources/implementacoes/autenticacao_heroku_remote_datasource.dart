import 'dart:convert';

import '../../modelos/token_model.dart';
import '../../modelos/usuario_model.dart';
import '../autenticacao_remote_datasource_interface.dart';

import 'package:http/http.dart' as http;

class AutenticacaoHerokuRemoteDatasource
    implements IAutenticacaoRemoteDatasource {
  String apiURL = 'https://pacific-ravine-59367.herokuapp.com';

  @override
  Future<http.Response> criarConta(String email, String senha) {
    // TODO: implement criarConta
    throw UnimplementedError();
  }

  @override
  Future<UsuarioModel> login(String email, String senha) async {
    await Future.delayed(const Duration(seconds: 2));

    return UsuarioModel(
      id: 1,
      email: 'email@email.com',
      token: TokenModel(
        valor: 'ahuh2uh31uehudhas44316532165463dasdawi',
        dataExpiracao: DateTime.now().add(const Duration(days: 3)),
      ),
    );

    // final response = await http.post(
    //   Uri.parse(apiURL),
    //   headers: {},
    //   body: json.encode({
    //     'email': email,
    //     'senha': senha,
    //   }),
    // );

    // if (response.statusCode == 201) {
    //   return UsuarioModel.fromJson(response.body);
    // }

    // // retornar mensagem de erro

    throw UnimplementedError();
  }
}
