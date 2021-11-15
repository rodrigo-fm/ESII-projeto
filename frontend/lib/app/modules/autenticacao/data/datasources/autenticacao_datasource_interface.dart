import 'package:http/http.dart' as http;

abstract class IAutenticacaoDatasource {
  Future<http.Response> login(String email, String senha);
  Future<http.Response> criarConta(String email, String senha);
}
