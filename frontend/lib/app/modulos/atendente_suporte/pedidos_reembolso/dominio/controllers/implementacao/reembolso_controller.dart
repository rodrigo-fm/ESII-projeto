import 'package:dartz/dartz.dart';

import '../../../dados/datasource/pedido_reembolso_remote_datasource_interface.dart';
import '../../../dados/modelo/pedidos_reembolso_model.dart';
import '../reembolso_controller_interface.dart';

class ReembolsoController implements IReembolsoController {
  @override
  Future<Either<String, bool>> aprovarReembolso(
    IPedidoReembolsoRemoteDatasource datasource,
    PedidoReembolsoModel reembolso,
  ) async {
    try {
      final resultado = await datasource.aprovarReembolso(reembolso);
      return Right(resultado.statusCode == 201);
    } catch (e) {
      return const Left('Erro de conexão');
    }
  }

  @override
  Future<Either<String, bool>> rejeitarReembolso(
    IPedidoReembolsoRemoteDatasource datasource,
    PedidoReembolsoModel reembolso,
    String motivoRecusa,
  ) async {
    try {
      final resultado = await datasource.rejeitarReembolso(
        reembolso,
        motivoRecusa,
      );
      return Right(resultado.statusCode == 201);
    } catch (e) {
      return const Left('Erro de conexão');
    }
  }
}
