import 'package:flutter/material.dart';

import '../../../../../../compartilhado/domain/helpers/state_helper.dart';
import '../../../../../../compartilhado/presentation/states/generico_state.dart';
import '../../../../compra/dados/datasources/implementacoes/credenciais_heroku_remote_datasource.dart';
import '../../../../compra/dominio/controller/credenciais_controllers_interface.dart';
import '../../../../compra/dominio/controller/implementacoes/credenciais_controller.dart';

class VisualizarDadosContaViewcontroller {
  Stream<GenericoState> removerDadosState(
    ICredenciaisController controller,
    int idCartao,
  ) async* {
    yield LoadingState();

    final resultado = await controller.removerDadosPagamento(
      CredenciaisHerokuRemoteDatasource(),
      idCartao,
    );

    yield resultado.fold(
      (erro) => FalhaState(erro),
      (booleano) {
        if (booleano) {
          return SucessoState('Dados de pagamento removidos com sucesso.');
        }
        return FalhaState('Erro ao salvar dados de pagamento');
      },
    );
  }

  void removerDados(BuildContext ctx, int idUsuario, Function() atualizar) {
    removerDadosState(CredenciaisController(), idUsuario).listen(
      (state) => StateHelper.listen(
        state,
        ctx,
        sucessoNavigate: () {
          atualizar();
        },
      ),
    );
  }
}
