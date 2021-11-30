import 'package:dartz/dartz.dart';

import '../../dados/datasource/passagem_aerea_remote_datasource_interface.dart';
import '../../dados/modelos/filtros_model.dart';
import '../../dados/modelos/passagem_aerea_model.dart';

abstract class IPassagemAereaController {
  Future<Either<String, List<PassagemAereaModel>>> buscarPassagens(
    IPassagemAereaRemoteDatasource datasource,
    FiltrosModel filtros,
  );
}
