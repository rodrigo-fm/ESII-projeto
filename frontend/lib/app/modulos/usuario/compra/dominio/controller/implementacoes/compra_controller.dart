import 'package:dartz/dartz.dart';

import '../../../../passagem_aerea/dados/modelos/passagem_aerea_model.dart';
import '../../../../passagem_aerea/dados/modelos/voo_model.dart';
import '../../../dados/datasources/compra_remote_datasource_interface.dart';
import '../compra_controller_interface.dart';

class CompraController implements ICompraController {
  // @override
  // Future<Either<String, List<PassagemAereaModel>>> historicoDeCompras(
  //   int idUsuario,
  //   ICompraRemoteDatasource datasource,
  // ) async {
  //   try {
  //     await Future.delayed(const Duration(seconds: 1));

  //     List<PassagemAereaModel> resultado = [];
  //     for (int i = 0; i < 8; i++) {
  //       resultado.add(
  //         PassagemAereaModel(
  //           id: (i + 1),
  //           numeroAssento: 10 + (i + 1),
  //           classe: 'Econômica',
  //           voo: VooModel(
  //             companhiaAerea: 'Companhia verde',
  //             dataPartida: DateTime.now().add(Duration(days: i)),
  //             destino: 'AJU',
  //             origem: 'GRU',
  //             duracao: 70 + (10 * i),
  //             id: i + 1,
  //           ),
  //           preco: 250 * (i + 1),
  //         ),
  //       );
  //     }
  //     if (resultado.isEmpty) {
  //       return const Left('Nenhuma passagem aérea encontrada');
  //     }
  //     return Right(resultado);
  //   } catch (e) {
  //     return const Left('Erro ao resgatar compras');
  //   }
  // }

  @override
  Future<Either<String, bool>> comprarPassagem(
    ICompraRemoteDatasource datasource,
    PassagemAereaModel? passagem,
    int idUsuario,
  ) async {
    try {
      if (passagem != null) {
        final resultado = await datasource.comprarPassagem(idUsuario, passagem);
        return Right(resultado.statusCode == 201);
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
