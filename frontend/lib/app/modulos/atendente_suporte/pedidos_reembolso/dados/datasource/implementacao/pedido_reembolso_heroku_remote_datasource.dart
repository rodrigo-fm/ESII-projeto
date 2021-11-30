import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../modelo/pedidos_reembolso_model.dart';
import '../pedido_reembolso_remote_datasource_interface.dart';

class PedidoReembolsoHerokuRemoteDatasource
    implements IPedidoReembolsoRemoteDatasource {
  final String apiURL = 'https://pacific-ravine-59367.herokuapp.com';

  @override
  Future<http.Response> aprovarReembolso(
    PedidoReembolsoModel reembolso,
  ) async {
    return await http.put(
      Uri.parse('$apiURL/reembolso/rota-aqui'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'id': reembolso.id,
        'aprovado': true,
        'dataAbertura': reembolso.dataAbertura,
        'motivoSolicitacao': reembolso.motivoSolicitacao,
        'motivoRecusa': null,
      }),
    );
  }

  @override
  Future<http.Response> rejeitarReembolso(
    PedidoReembolsoModel reembolso,
    String motivoRecusa,
  ) async {
    return await http.put(
      Uri.parse('$apiURL/reembolso/rota-aqui'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'id': reembolso.id,
        'aprovado': false,
        'dataAbertura': reembolso.dataAbertura,
        'motivoSolicitacao': reembolso.motivoSolicitacao,
        'motivoRecusa': motivoRecusa,
      }),
    );
  }
}
