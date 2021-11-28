import 'package:flutter/material.dart';

import '../../../../../compartilhado/domain/helpers/snackbar_helper.dart';
import '../../../../../compartilhado/presentation/routes/global_routes.dart';
import '../../../../../compartilhado/presentation/widgets/dialogs/loading_dialog_widget.dart';
import '../../../data/datasources/implementacoes/autenticacao_heroku_remote_datasource.dart';
import '../../../domain/controllers/autenticacao_controller_interface.dart';
import '../../../domain/controllers/implementacoes/autenticacao_controller.dart';
import '../../../domain/validators/criar_conta_validator.dart';
import 'criar_conta_state.dart';

class CriarContaViewcontroller {
  final formKey = GlobalKey<FormState>();
  final inputControllers = {
    'nome': TextEditingController(),
    'email': TextEditingController(),
    'senha': TextEditingController(),
    'confirmarSenha': TextEditingController(),
  };

  Stream<CriarContaState> criarContaStates(
    IAutenticacaoController controller,
    BuildContext ctx,
  ) async* {
    final validator = CriarContaValidator();
    String? formularioValido = validator(
      formKey,
      inputControllers['senha']!.text,
      inputControllers['confirmarSenha']!.text,
    );

    if (formularioValido != null) {
      if (formularioValido.isNotEmpty) {
        yield FalhaState(formularioValido);
      }
      return;
    }

    yield LoadingState();

    final resultado = await controller.criarConta(
      inputControllers['nome']!.text,
      inputControllers['email']!.text,
      inputControllers['senha']!.text,
      AutenticacaoHerokuRemoteDatasource(),
    );

    yield resultado.fold(
      (mensagemErro) => FalhaState(mensagemErro),
      (sucesso) => SucessoState('Conta criada com sucesso'),
    );
  }

  Future<void> criarConta(BuildContext ctx) async {
    bool loading = false;
    criarContaStates(AutenticacaoController(), ctx).listen((value) {
      if (value is LoadingState) {
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
        if (value is FalhaState) {
          SnackBarHelper.exibirErro(ctx, value.mensagem);
        } else if (value is SucessoState) {
          SnackBarHelper.exibirSucesso(ctx, value.mensagem);
          Navigator.of(ctx).pushReplacementNamed(GlobalRoutes.login);
        }
      }
    });
  }
}
