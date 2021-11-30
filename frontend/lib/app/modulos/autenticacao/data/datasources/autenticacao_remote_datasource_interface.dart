import 'package:http/http.dart' as http;

abstract class IAutenticacaoRemoteDatasource {
  Future<http.Response> login(
    String email,
    String senha,
  );
  Future<http.Response> criarConta(
    String nome,
    String email,
    String senha,
  );
}
