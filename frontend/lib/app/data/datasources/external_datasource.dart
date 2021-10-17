import 'package:http/http.dart' as http;

// datasource com requisições http
class ExternalDataSource {
  // link da api
  final String url = 'link da api aqui';

  // método qualquer de exemplo
  Future<void> getPassagens() async {
    final response = await http.get(Uri.parse('$url/endpoint'));

    // sucesso
    if(response.statusCode == 200) {
      // retornar coisas daora aqui
    }
    // falha
    else {
      throw Exception();
    }
  }

}