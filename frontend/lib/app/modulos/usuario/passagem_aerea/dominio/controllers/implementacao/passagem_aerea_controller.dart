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
      return Right(
        passagens.where(
          (passagem) {
            if (filtros.dataVolta != null) {}
            return passagem.voo.origem == filtros.origem &&
                passagem.voo.destino == filtros.destino &&
                passagem.voo.dataPartida.day == filtros.dataIda.day;
          },
        ).toList(),
      );
    } catch (e) {
      return const Left('Erro ao buscar no servidor');
    }
  }
}
