import 'package:flutter/material.dart';
import 'package:frontend2/app/modulos/autenticacao/data/datasources/implementacoes/autenticacao_heroku_remote_datasource.dart';
import 'package:frontend2/app/modulos/autenticacao/domain/controllers/implementacoes/autenticacao_controller.dart';

import '../../../domain/controllers/autenticacao_controller_interface.dart';
import '../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../../../compartilhado/presentation/widgets/dialogs/loading_dialog_widget.dart';
import '../../../domain/validators/login_validator.dart';
import 'login_states.dart';

class LoginViewController {
  final formKey = GlobalKey<FormState>();
  final inputControllers = {
    'email': TextEditingController(),
    'password': TextEditingController(),
  };

  Stream<LoginState> loginStates(IAutenticacaoController controller) async* {
    final validator = LoginValidator();

    if (!validator(formKey)) {
      return;
    }

    yield LoadingLoginState();

    final resultado = await controller.login(
      inputControllers['email']!.text,
      inputControllers['password']!.text,
      AutenticacaoHerokuRemoteDatasource(),
    );

    yield resultado.fold(
      (mensagemErro) => FalhaLoginState(mensagemErro),
      (sucesso) => SucessoLoginState(),
    );
  }

  Future<void> login(BuildContext ctx) async {
    bool loading = false;
    loginStates(AutenticacaoController()).listen((value) {
      if (value is LoadingLoginState) {
        loading = true;
        showDialog(
          context: ctx,
          builder: (ctx) => const LoadingDialogWidget(),
        );
      } else {
        if (loading) {
          loading = false;
          // esconde o widget de loading
          Navigator.of(ctx).pop();
        }
        if (value is FalhaLoginState) {
          // exibir mensagem de erro
          // usar o atributo "value.mensagem" na mensagem
        } else if (value is SucessoLoginState) {
          Navigator.of(ctx).pushNamed(UsuarioRoutes.home);
        }
      }
    });
  }
}
