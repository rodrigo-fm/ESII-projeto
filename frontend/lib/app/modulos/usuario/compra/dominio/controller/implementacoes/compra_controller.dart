import 'package:dartz/dartz.dart';

import '../../../../passagem_aerea/dados/modelos/passagem_aerea_model.dart';
import '../../../dados/datasources/compra_remote_datasource_interface.dart';
import '../compra_controller_interface.dart';

class CompraController implements ICompraController {
  @override
  Future<Either<String, bool>> comprarPassagem(
    ICompraRemoteDatasource datasource,
    PassagemAereaModel? passagem,
    int idUsuario,
  ) async {
    try {
      if (passagem != null) {
        final resultado = await datasource.comprarPassagem(idUsuario, passagem);
        return Right(resultado.statusCode == 200);
      }
      return const Left('Passagem aérea não especificada');
    } catch (e) {
      return const Left('Erro de conexão');
    }
  }

  @override
  Future<Either<String, bool>> solicitarReembolso(
    ICompraRemoteDatasource datasource,
    PassagemAereaModel passagem,
    int idUsuario,
  ) async {
    try {
      final resultado = await datasource.comprarPassagem(
        idUsuario,
        passagem,
      );
      return Right(resultado.statusCode == 201);
    } catch (e) {
      return const Left('Erro de conexão');
    }
  }

  @override
  Future<Either<String, List<PassagemAereaModel>>> resgatarCompras(
    ICompraRemoteDatasource datasource,
    int idUsuario,
  ) async {
    try {
      final resultado = await datasource.getHistoricoCompras(idUsuario);
      if (resultado.statusCode == 200) {
        final passagens = PassagemAereaModel.fromJsonList(resultado.body);
        if (passagens.isEmpty) {
          return const Left('Nenhuma compra encontrada');
        }
        return Right(passagens);
      }

      return const Left('Erro ao resgatar passagens');
    } catch (e) {
      return const Left('Erro de conexão com o banco');
    }
  }
}
