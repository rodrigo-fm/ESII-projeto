abstract class LoginState {}

class SucessoLoginState implements LoginState {}

class FalhaLoginState implements LoginState {
  final String mensagem;

  FalhaLoginState(this.mensagem);
}

class LoadingLoginState implements LoginState {}
