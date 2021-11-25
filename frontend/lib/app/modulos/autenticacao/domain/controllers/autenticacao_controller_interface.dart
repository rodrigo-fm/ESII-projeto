import 'package:dartz/dartz.dart';

import '../../data/modelos/usuario_model.dart';
import '../../data/datasources/autenticacao_remote_datasource_interface.dart';

abstract class IAutenticacaoController {
  Future<Either<String, UsuarioModel>> login(
    String email,
    String senha,
    IAutenticacaoRemoteDatasource datasource,
  );
  Future<void> logout();
  Future<void> autoLogin();
  Future<void> criarConta();
}
