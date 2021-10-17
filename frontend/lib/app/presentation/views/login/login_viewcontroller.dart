import 'login_states.dart';

class LoginViewController {

  // função qualquer para tratar os campos do formulários
  bool tratarFormulario() {
    return true;
  }

  Stream<LoginState> enviarFormularioStream() async* {
    // aqui entra o gerenciamento de estados da view
    // note que LoginState é uma classe abstrata para implementar inversão de dependência
  }

  void enviarFormulario() {
    enviarFormularioStream().listen((value) {
      // colocar os widgets retornados de acordo com o estado da view aqui
    });
  }

}