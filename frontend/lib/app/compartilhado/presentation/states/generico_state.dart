abstract class GenericoState {}

class LoadingState implements GenericoState {}

class FalhaState implements GenericoState {
  final String mensagem;

  FalhaState(this.mensagem);
}

class SucessoState implements GenericoState {
  final String mensagem;

  SucessoState(this.mensagem);
}
