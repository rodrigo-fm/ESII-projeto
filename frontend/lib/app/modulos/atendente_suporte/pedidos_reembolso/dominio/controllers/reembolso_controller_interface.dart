import 'package:dartz/dartz.dart';

import '../../dados/datasource/pedido_reembolso_remote_datasource_interface.dart';
import '../../dados/modelo/pedidos_reembolso_model.dart';

abstract class IReembolsoController {
  Future<Either<String, bool>> aprovarReembolso(
    IPedidoReembolsoRemoteDatasource datasource,
    PedidoReembolsoModel reembolso,
  );
  Future<Either<String, bool>> rejeitarReembolso(
    IPedidoReembolsoRemoteDatasource datasource,
    PedidoReembolsoModel reembolso,
    String motivoRecusa,
  );
}
