import 'package:aterrissar/app/modulos/usuario/passagem_aerea/dados/modelos/passagem_aerea_model.dart';
import 'package:http/http.dart' as http;

abstract class ICompraRemoteDatasource {
  Future<http.Response> getHistoricoCompras(int idUsuario);
  Future<http.Response> comprarPassagem(
    int idUsuario,
    PassagemAereaModel passagem,
  );
}
