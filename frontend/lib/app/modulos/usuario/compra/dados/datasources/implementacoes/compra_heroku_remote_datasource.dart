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
    return await http.get(Uri.parse('$apiURL/compra/usuario/$idUsuario'));
  }

  @override
  Future<http.Response> comprarPassagem(
    int idUsuario,
    PassagemAereaModel passagem,
  ) async {
    return await http.post(
      Uri.parse('$apiURL/compra/usuario/$idUsuario'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'id': passagem.id,
        'preco': passagem.preco,
        'classe': passagem.classe,
        'dataCompra': DateTime.now().millisecondsSinceEpoch.toString(),
        'voo': {
          'id': passagem.voo.id,
          'destino': passagem.voo.destino,
          'origem': passagem.voo.origem,
          'dataPartida':
              passagem.voo.dataPartida.millisecondsSinceEpoch.toString(),
          'duracao': passagem.voo.duracao,
          'companhiaAerea': passagem.voo.companhiaAerea,
        },
      }),
    );
  }

  @override
  Future<http.Response> solicitarReembolso(
    int idUsuario,
    PassagemAereaModel passagem,
  ) async {
    return await http.post(
      Uri.parse('$apiURL/rota/de/reembolso'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'idUsuario': idUsuario,
      }),
    );
  }
}
