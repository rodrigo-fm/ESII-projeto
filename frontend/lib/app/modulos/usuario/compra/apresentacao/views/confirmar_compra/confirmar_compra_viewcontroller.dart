import 'package:aterrissar/app/modulos/usuario/compra/dados/datasources/implementacoes/compra_heroku_remote_datasource.dart';
import 'package:aterrissar/app/modulos/usuario/compra/dados/datasources/implementacoes/credenciais_heroku_remote_datasource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../compartilhado/domain/helpers/dialog_helper.dart';
import '../../../../../../compartilhado/domain/helpers/snackbar_helper.dart';
import '../../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../dominio/controller/compra_controller_interface.dart';
import '../../../dominio/controller/credenciais_controllers_interface.dart';
import '../../../dominio/controller/implementacoes/compra_controller.dart';
import '../../../dominio/controller/implementacoes/credenciais_controller.dart';
import '../../../dominio/provider/compra_provider.dart';
import 'confirmar_compra_state.dart';

class ConfirmarCompraViewcontroller {
  final formKey = GlobalKey<FormState>();

  Stream<ConfirmarCompraState> comprarStates(
    ICredenciaisController credenciaisController,
    ICompraController compraController,
    int idUsuario,
    BuildContext ctx,
  ) async* {
    final compraProvider = Provider.of<CompraProvider>(ctx, listen: false);
    // final validator = CompraValidator();

    // if (!validator(formKey)) {
    //   return;
    // }

    yield LoadingState();

    final compra = await compraController.comprarPassagem(
      CompraHerokuRemoteDatasource(),
      idUsuario,
    );

    yield compra.fold((erro) => FalhaState(erro), (booleano) {
      if (booleano) {
        return LoadingState();
      }
      return FalhaState('Erro ao armazenar realizar compra');
    });

    final cartao = await credenciaisController.salvarDadosPagamento(
      CredenciaisHerokuRemoteDatasource(),
      compraProvider.dadosPagamento,
      idUsuario,
    );

    yield cartao.fold(
      (erro) => FalhaState(erro),
      (booleano) {
        if (booleano) {
          return LoadingState();
        }
        return FalhaState('Erro ao armazenar dados do cartão');
      },
    );

    final dadosPessoais = await credenciaisController.salvarDadosPessoais(
      CredenciaisHerokuRemoteDatasource(),
      compraProvider.dadosPessoais,
      idUsuario,
    );

    yield dadosPessoais.fold(
      (erro) => FalhaState(erro),
      (booleano) {
        if (booleano) {
          return SucessoState('Compra realizada com sucesso');
        }
        return FalhaState('Erro ao armazenar dados pessoais');
      },
    );
  }

  Future<void> comprar(BuildContext ctx, int idUsuario) async {
    comprarStates(
      CredenciaisController(),
      CompraController(),
      idUsuario,
      ctx,
    ).listen((value) {
      if (value is LoadingState) {
        DialogHelper.exibirLoading(ctx);
      } else {
        DialogHelper.esconderDialog(ctx);
        if (value is FalhaState) {
          SnackBarHelper.exibirErro(ctx, value.mensagem);
        } else if (value is SucessoState) {
          SnackBarHelper.exibirSucesso(ctx, value.mensagem);
          Navigator.of(ctx).pushReplacementNamed(
            UsuarioRoutes.buscarPassagens,
          );
        }
      }
    });
  }
}
