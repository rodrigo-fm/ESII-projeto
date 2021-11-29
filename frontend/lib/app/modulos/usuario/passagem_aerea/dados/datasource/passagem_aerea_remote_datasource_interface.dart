import 'package:http/http.dart' as http;

abstract class IPassagemAereaRemoteDatasource {
  Future<String> buscarPassagens();
}
