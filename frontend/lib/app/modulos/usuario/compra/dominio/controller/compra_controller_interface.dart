import 'package:aterrissar/app/modulos/usuario/compra/dados/datasources/compra_remote_datasource_interface.dart';

import '../../../passagem_aerea/dados/modelos/passagem_aerea_model.dart';
import 'package:dartz/dartz.dart';

abstract class ICompraController {
  Future<Either<String, List<PassagemAereaModel>>> historicoDeCompras(
    int idUsuario,
    ICompraRemoteDatasource datasource,
  );

  Future<Either<String, bool>> comprarPassagem(
    ICompraRemoteDatasource datasource,
    PassagemAereaModel? passagem,
    int idUsuario,
  );

  Future<Either<String, bool>> solicitarReembolso(
    ICompraRemoteDatasource datasource,
    PassagemAereaModel passagem,
    int idUsuario,
  );
}
