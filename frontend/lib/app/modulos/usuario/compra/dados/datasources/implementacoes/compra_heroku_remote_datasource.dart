import 'package:http/http.dart' as http;

import '../compra_remote_datasource_interface.dart';

class CompraHerokuRemoteDatasource implements ICompraRemoteDatasource {
  @override
  Future<http.Response> getHistoricoCompras(int idUsuario) async {
    // TODO: implement getHistoricoCompras
    throw UnimplementedError();
  }
}
