abstract class MenuConfiguracaoSuporteState {}

class LoadingState implements MenuConfiguracaoSuporteState {}

class SucessoState implements MenuConfiguracaoSuporteState {}

class FalhaState implements MenuConfiguracaoSuporteState {
  final String mensagem;

  FalhaState(this.mensagem);
}
