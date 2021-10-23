abstract class IAutenticacaoRepository {
  Future<void> autoLogin();
  Future<void> criarConta();
  Future<void> login(String email, String senha);
  Future<void> logout();
}
