import 'dart:convert';

import '../../../../passagem_aerea/dados/modelos/passagem_aerea_model.dart';
import 'package:http/http.dart' as http;

import '../compra_remote_datasource_interface.dart';

class CompraHerokuRemoteDatasource implements ICompraRemoteDatasource {
  final String apiURL = 'https://pacific-ravine-59367.herokuapp.com';

  @override
  Future<http.Response> getHistoricoCompras(
    int idUsuario,
  ) async {
    // TODO: implement getHistoricoCompras
    throw UnimplementedError();
  }

  @override
  Future<http.Response> comprarPassagem(
    int idUsuario,
    PassagemAereaModel passagem,
  ) async {
    return await http.post(
      Uri.parse('$apiURL/passagem/comprar'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'id': passagem.id,
        'preco': passagem.preco,
        'classe': passagem.classe,
        'voo': {
          'id': passagem.voo.id,
          'destino': passagem.voo.destino,
          'origem': passagem.voo.origem,
          'dataPartida': passagem.voo.dataPartida.millisecondsSinceEpoch,
          'duracao': passagem.voo.duracao,
          'companhiaAerea': passagem.voo.companhiaAerea,
        },
      }),
    );
  }
}
