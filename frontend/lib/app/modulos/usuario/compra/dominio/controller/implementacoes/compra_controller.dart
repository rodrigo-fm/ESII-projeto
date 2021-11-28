import 'package:dartz/dartz.dart';

import '../../../../passagem_aerea/dados/modelos/passagem_aerea_model.dart';
import '../../../../passagem_aerea/dados/modelos/voo_model.dart';
import '../../../dados/datasources/compra_remote_datasource_interface.dart';
import '../compra_controller_interface.dart';

class CompraController implements ICompraController {
  @override
  Future<Either<String, List<PassagemAereaModel>>> historicoDeCompras(
    int idUsuario,
    ICompraRemoteDatasource datasource,
  ) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

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
      return const Left('Erro ao resgatar compras');
    }
  }
}
