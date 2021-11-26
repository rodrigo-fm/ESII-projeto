import 'package:http/http.dart' as http;

import '../passagem_aerea_remote_datasource_interface.dart';

class PassagemAereaHerokuRemoteDatasource
    implements IPassagemAereaRemoteDatasource {
  final String apiURL = 'https://pacific-ravine-59367.herokuapp.com';

  @override
  Future<http.Response> buscarPassagens(String token) async {
    final response = await http.post(
      Uri.parse('$apiURL/passagens/buscar'),
      headers: {},
      body: {},
    );

    return response;
  }
}
