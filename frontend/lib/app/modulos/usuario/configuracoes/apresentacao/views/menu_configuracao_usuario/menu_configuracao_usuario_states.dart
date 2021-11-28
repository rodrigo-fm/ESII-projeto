abstract class MenuConfiguracaoUsuarioState {}

class LoadingState implements MenuConfiguracaoUsuarioState {}

class SucessoState implements MenuConfiguracaoUsuarioState {}

class FalhaState implements MenuConfiguracaoUsuarioState {
  final String mensagem;

  FalhaState(this.mensagem);
}
