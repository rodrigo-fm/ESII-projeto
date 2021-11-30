import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../compartilhado/domain/helpers/state_helper.dart';
import '../../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../../../../compartilhado/presentation/states/generico_state.dart';
import '../../../dados/datasources/implementacoes/compra_heroku_remote_datasource.dart';
import '../../../dominio/controller/compra_controller_interface.dart';
import '../../../dominio/controller/implementacoes/compra_controller.dart';
import '../../../dominio/provider/compra_provider.dart';

class ExibirNormasVooViewcontroller {
  final formKey = GlobalKey<FormState>();

  Stream<GenericoState> comprarStates(
    ICompraController compraController,
    int idUsuario,
    BuildContext ctx,
  ) async* {
    final compraProvider = Provider.of<CompraProvider>(ctx, listen: false);

    yield LoadingState();

    final compra = await compraController.comprarPassagem(
      CompraHerokuRemoteDatasource(),
      compraProvider.passagemEscolhida,
      idUsuario,
    );

    yield compra.fold((erro) => FalhaState(erro), (booleano) {
      if (booleano) {
        return SucessoState('Compra realizada com sucesso');
      }
      return FalhaState('Erro ao realizar compra');
    });
  }

  Future<void> comprar(BuildContext ctx, int idUsuario) async {
    comprarStates(
      CompraController(),
      idUsuario,
      ctx,
    ).listen((value) {
      StateHelper.listen(
        value,
        ctx,
        sucessoNavigate: () {
          Navigator.of(ctx).pushReplacementNamed(
            UsuarioRoutes.buscarPassagens,
          );
        },
      );
      // if (value is LoadingState) {
      //   DialogHelper.exibirLoading(ctx);
      // } else {
      //   DialogHelper.esconderDialog(ctx);
      //   if (value is FalhaState) {
      //     SnackBarHelper.exibirErro(ctx, value.mensagem);
      //   } else if (value is SucessoState) {
      //     SnackBarHelper.exibirSucesso(ctx, value.mensagem);
      //     Navigator.of(ctx).pushReplacementNamed(
      //       UsuarioRoutes.buscarPassagens,
      //     );
      //   }
      // }
    });
  }
}
