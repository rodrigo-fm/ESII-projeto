abstract class IAutenticacaoController {
  Future<void> login(String email, String senha);
  Future<void> logout();
  Future<void> autoLogin();
  Future<void> criarConta();
}
