import 'package:aterrissar/app/modulos/usuario/passagem_aerea/dados/modelos/filtros_model.dart';
import 'package:dartz/dartz.dart';

import '../../../dados/datasource/passagem_aerea_remote_datasource_interface.dart';
import '../../../dados/modelos/passagem_aerea_model.dart';
import '../passagem_aerea_controller_interface.dart';

class PassagemAereaController implements IPassagemAereaController {
  @override
  Future<Either<String, List<PassagemAereaModel>>> buscarPassagens(
    IPassagemAereaRemoteDatasource datasource,
    FiltrosModel filtros,
  ) async {
    try {
      final resultado = await datasource.buscarPassagens();
      final passagens = PassagemAereaModel.fromJsonList(resultado);

      if (passagens.isEmpty) {
        return const Left('Nenhuma passagem aérea encontrada');
      }
      // TODO: calcular a data de volta do voo
      // TODO: ajustar jsons das passagens para uma data correta na hora
      // da apresentação
      return Right(
        passagens.where(
          (passagem) {
            return passagem.voo.origem == filtros.origem &&
                passagem.voo.destino == filtros.destino;
          },
        ).toList(),
      );
    } catch (e) {
      return const Left('Erro ao buscar no servidor');
    }
  }
}
