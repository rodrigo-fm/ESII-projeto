import 'package:flutter/material.dart';

import '../../../../../shared/presentation/routes/usuario_routes.dart';
import '../../../../../shared/presentation/widgets/dialogs/loading_dialog_widget.dart';
import '../../../domain/validators/login_validator.dart';
import 'login_states.dart';

class LoginViewController {
  final formKey = GlobalKey<FormState>();
  final inputControllers = {
    'email': TextEditingController(),
    'password': TextEditingController(),
  };

  Stream<LoginState> loginStates() async* {
    final validator = LoginValidator();

    if (!validator(formKey)) {
      return;
    }

    yield LoadingLoginState();

    await Future.delayed(const Duration(seconds: 3));

    // caso dê erro na requisição ou no caso de uso:
    // yield FalhaLoginState('Erro ao realizar login');

    yield SucessoLoginState();
  }

  Future<void> login(BuildContext ctx) async {
    bool loading = false;
    loginStates().listen((value) {
      if (value is LoadingLoginState) {
        loading = true;
        showDialog(
          context: ctx,
          builder: (ctx) => const LoadingDialogWidget(),
        );
      } else {
        if (loading) {
          loading = false;
          Navigator.of(ctx).pop();
        }
        if (value is FalhaLoginState) {
          // exibir mensagem de erro
          // usar o atributo "value.mensagem" na mensagem
        } else if (value is SucessoLoginState) {
          // redirecionar para a tela principal
          Navigator.of(ctx).pushNamed(UsuarioRoutes.home);
        }
      }
    });
  }
}
