import 'package:dartz/dartz.dart';

import '../../../dados/datasource/passagem_aerea_remote_datasource_interface.dart';
import '../../../dados/modelos/passagem_aerea_model.dart';
import '../../../dados/modelos/voo_model.dart';
import '../passagem_aerea_controller_interface.dart';

class PassagemAereaController implements IPassagemAereaController {
  @override
  Future<Either<String, List<PassagemAereaModel>>> buscarPassagens(
    String token,
    IPassagemAereaRemoteDatasource datasource,
  ) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      List<PassagemAereaModel> resultado = [];
      for (int i = 0; i < 8; i++) {
        resultado.add(
          PassagemAereaModel(
            id: (i + 1),
            numeroAssento: 10 + (i + 1),
            classe: 'Econômica',
            voo: VooModel(
              companhiaAerea: 'Companhia verde',
              dataPartida: DateTime.now().add(Duration(days: i)),
              destino: 'AJU',
              origem: 'GRU',
              duracao: 70 + (10 * i),
              id: i + 1,
            ),
            preco: 250 * (i + 1),
          ),
        );
      }
      if (resultado.isEmpty) {
        return const Left('Nenhuma passagem aérea encontrada');
      }
      return Right(resultado);
    } catch (e) {
      return const Left('erro');
    }
  }
}
