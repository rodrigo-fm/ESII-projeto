import 'package:http/http.dart' as http;

abstract class IPassagemAereaRemoteDatasource {
  Future<http.Response> buscarPassagens(
    String token,
  );
}
