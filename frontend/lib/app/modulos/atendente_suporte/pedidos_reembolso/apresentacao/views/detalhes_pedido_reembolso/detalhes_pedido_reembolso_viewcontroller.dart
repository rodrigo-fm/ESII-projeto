import 'package:flutter/material.dart';

import '../../../../../../compartilhado/domain/helpers/state_helper.dart';
import '../../../../../../compartilhado/presentation/routes/suporte_routes.dart';
import '../../../../../../compartilhado/presentation/states/generico_state.dart';
import '../../../dados/datasource/implementacao/pedido_reembolso_heroku_remote_datasource.dart';
import '../../../dados/modelo/pedidos_reembolso_model.dart';
import '../../../dominio/controllers/implementacao/reembolso_controller.dart';
import '../../../dominio/controllers/reembolso_controller_interface.dart';

class DetalhesPedidoReembolsoViewcontroller {
  String motivoRecusa = 'Pedido de reembolso rejeitado';

  Stream<GenericoState> avaliarReembolsoState(
    IReembolsoController controller,
    PedidoReembolsoModel reembolso,
    bool aprovado,
  ) async* {
    if (!aprovado && motivoRecusa.isEmpty) {
      return;
    }

    yield LoadingState();

    // DESCOMENTAR ESTA LINHA PARA FINALIZAR A INTEGRAÇÃO
    final resultado = aprovado
        ? await controller.aprovarReembolso(
            PedidoReembolsoHerokuRemoteDatasource(),
            reembolso,
          )
        : await controller.rejeitarReembolso(
            PedidoReembolsoHerokuRemoteDatasource(),
            reembolso,
            motivoRecusa,
          );

    yield resultado.fold(
      (erro) => FalhaState(erro),
      (booleano) {
        if (booleano) {
          return SucessoState(
            aprovado
                ? 'Reembolso aprovado com sucesso'
                : 'Reembolso rejeitado com sucesso',
          );
        }
        return FalhaState('Erro ao processar reembolso');
      },
    );

    // DELETAR ESTA LINHA PARA FINALIZAR INTEGRAÇÃO
    // yield SucessoState('Sucesso');
  }

  void avaliarReembolso(
    BuildContext ctx,
    bool aprovado,
    PedidoReembolsoModel reembolso,
  ) {
    avaliarReembolsoState(
      ReembolsoController(),
      reembolso,
      aprovado,
    ).listen(
      (state) => StateHelper.listen(
        state,
        ctx,
        sucessoNavigate: () {
          Navigator.of(ctx).pushNamed(
            SuporteRoutes.visualizarPedidos,
          );
        },
      ),
    );
  }
}
