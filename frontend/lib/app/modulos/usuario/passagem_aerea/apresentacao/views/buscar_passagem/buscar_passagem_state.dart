import '../../../dados/modelos/passagem_aerea_model.dart';

abstract class BuscarPassagemState {}

class LoadingState implements BuscarPassagemState {}

class FalhaState implements BuscarPassagemState {
  final String mensagem;

  FalhaState(this.mensagem);
}

class SucessoState implements BuscarPassagemState {
  List<PassagemAereaModel> passagens;

  SucessoState(this.passagens);
}
