import 'package:http/http.dart' as http;

import '../modelo/pedidos_reembolso_model.dart';

abstract class IPedidoReembolsoRemoteDatasource {
  Future<http.Response> aprovarReembolso(PedidoReembolsoModel reembolso);
  Future<http.Response> rejeitarReembolso(
    PedidoReembolsoModel reembolso,
    String motivoRecusa,
  );
}
