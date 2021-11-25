// import '../autenticacao_controller_interface.dart';
import 'package:dartz/dartz.dart';

import '../../../data/datasources/autenticacao_remote_datasource_interface.dart';
import '../../../data/modelos/usuario_model.dart';
import '../autenticacao_controller_interface.dart';

class AutenticacaoController implements IAutenticacaoController {
  @override
  Future<void> autoLogin() {
    // TODO: implement autoLogin
    throw UnimplementedError();
  }

  @override
  Future<void> criarConta() {
    // TODO: implement criarConta
    throw UnimplementedError();
  }

  @override
  Future<Either<String, UsuarioModel>> login(
    String email,
    String senha,
    IAutenticacaoRemoteDatasource datasource,
  ) async {
    try {
      final resultado = await datasource.login(email, senha);
      return Right(resultado);
    } catch (e) {
      return const Left('mensagem de erro');
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
