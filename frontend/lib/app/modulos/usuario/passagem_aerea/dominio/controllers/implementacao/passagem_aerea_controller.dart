import 'package:dartz/dartz.dart';

import '../../../dados/datasource/passagem_aerea_remote_datasource_interface.dart';
import '../../../dados/modelos/passagem_aerea_model.dart';
import '../passagem_aerea_controller_interface.dart';

class PassagemAereaController implements IPassagemAereaController {
  @override
  Future<Either<String, List<PassagemAereaModel>>> buscarPassagens(
    IPassagemAereaRemoteDatasource datasource,
  ) async {
    try {
      final resultado = await datasource.buscarPassagens();
      final passagens = PassagemAereaModel.fromJsonList(resultado);

      if (passagens.isEmpty) {
        return const Left('Nenhuma passagem aérea encontrada');
      }
      return Right(passagens);
    } catch (e) {
      return const Left('Erro ao buscar no servidor');
    }
  }
}
