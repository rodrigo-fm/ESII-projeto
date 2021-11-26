import 'package:dartz/dartz.dart';

import '../../dados/datasource/passagem_aerea_remote_datasource_interface.dart';
import '../../dados/modelos/passagem_aerea_model.dart';
import '../passagem_aerea_controller_interface.dart';

class PassagemAereaController implements IPassagemAereaController {
  @override
  Future<Either<String, List<PassagemAereaModel>>> buscarPassagens(
    String token,
    IPassagemAereaRemoteDatasource datasource,
  ) {
    // TODO: implement buscarPassagens
    throw UnimplementedError();
  }
}
