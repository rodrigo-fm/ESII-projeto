import 'package:flutter/material.dart';

import '../../../../../compartilhado/domain/helpers/snackbar_helper.dart';
import '../../../../../compartilhado/presentation/routes/suporte_routes.dart';
import '../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../../../compartilhado/presentation/widgets/dialogs/loading_dialog_widget.dart';
import '../../../data/datasources/implementacoes/autenticacao_heroku_remote_datasource.dart';
import '../../../data/datasources/implementacoes/autenticacao_shared_preferences_local_datasource.dart';
import '../../../domain/controllers/autenticacao_controller_interface.dart';
import '../../../domain/controllers/implementacoes/autenticacao_controller.dart';
import '../../../domain/validators/login_validator.dart';
import 'login_states.dart';

class LoginViewController {
  final formKey = GlobalKey<FormState>();
  final inputControllers = {
    'email': TextEditingController(),
    'password': TextEditingController(),
  };

  Stream<LoginState> loginStates(
    IAutenticacaoController controller,
    BuildContext ctx,
  ) async* {
    final validator = LoginValidator();

    if (!validator(formKey)) {
      return;
    }

    yield LoadingLoginState();

    final resultado = await controller.login(
      inputControllers['email']!.text,
      inputControllers['password']!.text,
      AutenticacaoHerokuRemoteDatasource(),
      AutenticacaoSharedPreferencesLocalDatasource(),
      ctx,
    );

    yield resultado.fold(
      (mensagemErro) => FalhaLoginState(mensagemErro),
      (sucesso) => SucessoLoginState(),
    );
  }

  Future<void> login(BuildContext ctx) async {
    bool loading = false;
    loginStates(AutenticacaoController(), ctx).listen((value) {
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
          SnackBarHelper.exibirErro(ctx, value.mensagem);
        } else if (value is SucessoLoginState) {
          // Navigator.of(ctx).pushReplacementNamed(UsuarioRoutes.buscarPassagens);
          Navigator.of(ctx).pushReplacementNamed(
            SuporteRoutes.visualizarPedidos,
          );
        }
      }
    });
  }
}
