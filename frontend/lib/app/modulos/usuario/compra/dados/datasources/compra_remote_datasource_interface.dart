import 'package:http/http.dart' as http;

abstract class ICompraRemoteDatasource {
  Future<http.Response> getHistoricoCompras(int idUsuario);
  Future<http.Response> comprarPassagem(int idUsuario);
}
