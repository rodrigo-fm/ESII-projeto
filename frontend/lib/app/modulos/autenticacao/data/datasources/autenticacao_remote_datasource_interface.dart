import 'package:http/http.dart' as http;

import '../modelos/usuario_model.dart';

abstract class IAutenticacaoRemoteDatasource {
  Future<UsuarioModel> login(
    String email,
    String senha,
  );
  Future<http.Response> criarConta(
    String nome,
    String email,
    String senha,
  );
}
