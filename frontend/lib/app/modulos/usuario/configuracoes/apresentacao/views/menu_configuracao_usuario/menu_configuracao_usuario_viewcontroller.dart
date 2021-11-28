import 'package:flutter/material.dart';

import '../../../../../../compartilhado/domain/helpers/snackbar_helper.dart';
import '../../../../../../compartilhado/presentation/routes/global_routes.dart';
import '../../../../../../compartilhado/presentation/widgets/dialogs/loading_dialog_widget.dart';
import '../../../../../autenticacao/data/datasources/implementacoes/autenticacao_shared_preferences_local_datasource.dart';
import '../../../../../autenticacao/domain/controllers/autenticacao_controller_interface.dart';
import '../../../../../autenticacao/domain/controllers/implementacoes/autenticacao_controller.dart';
import 'menu_configuracao_usuario_states.dart';

class MenuConfiguracaoUsuarioViewcontroller {
  Stream<MenuConfiguracaoUsuarioState> logoutStates(
    IAutenticacaoController controller,
  ) async* {
    yield LoadingState();

    final resultado = await controller.logout(
      AutenticacaoSharedPreferencesLocalDatasource(),
    );

    yield resultado.fold(
      (mensagemErro) => FalhaState(mensagemErro),
      (sucesso) => SucessoState(),
    );
  }

  Future<void> logout(BuildContext ctx) async {
    bool loading = false;
    logoutStates(AutenticacaoController()).listen((value) {
      if (value is LoadingState) {
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
        if (value is FalhaState) {
          SnackBarHelper.exibirErro(ctx, value.mensagem);
        } else if (value is SucessoState) {
          // Navigator.of(ctx).pushNamed(UsuarioRoutes.home);
          Navigator.of(ctx).pushReplacementNamed(GlobalRoutes.login);
        }
      }
    });
  }
}
