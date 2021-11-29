abstract class ConfirmarCompraState {}

class LoadingState implements ConfirmarCompraState {}

class FalhaState implements ConfirmarCompraState {
  final String mensagem;

  FalhaState(this.mensagem);
}

class SucessoState implements ConfirmarCompraState {
  final String mensagem;

  SucessoState(this.mensagem);
}
