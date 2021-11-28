abstract class CriarContaState {}

class SucessoState implements CriarContaState {
  final String mensagem;

  SucessoState(this.mensagem);
}

class FalhaState implements CriarContaState {
  final String mensagem;

  FalhaState(this.mensagem);
}

class LoadingState implements CriarContaState {}
