import '../repositories/autenticacao_repository_interface.dart';

import '../../presentation/controllers/autenticacao_controller_interface.dart';

class AutenticacaoController implements IAutenticacaoController {
  final IAutenticacaoRepository repository;

  AutenticacaoController(this.repository);

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
  Future<void> login(String email, String senha) async {
    final resultado = repository.login(email, senha);
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
