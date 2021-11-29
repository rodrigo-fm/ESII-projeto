import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../passagem_aerea_remote_datasource_interface.dart';

class PassagemAereaHerokuRemoteDatasource
    implements IPassagemAereaRemoteDatasource {
  final String apiURL = 'https://pacific-ravine-59367.herokuapp.com';

  @override
  Future<String> buscarPassagens() async {
    final response = await rootBundle.loadString(
      'assets/mocks/horariosDeVoosV4.json',
    );
    return response;
  }
}
