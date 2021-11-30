import 'package:flutter/material.dart';

import '../../../../../../compartilhado/domain/helpers/state_helper.dart';
import '../../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../../../../compartilhado/presentation/states/generico_state.dart';
// import '../../../../compra/dados/datasources/implementacoes/compra_heroku_remote_datasource.dart';
import '../../../../compra/dominio/controller/compra_controller_interface.dart';
import '../../../../compra/dominio/controller/implementacoes/compra_controller.dart';
import '../../../../passagem_aerea/dados/modelos/passagem_aerea_model.dart';

class SolicitarReembolsoViewcontroller {
  final formKey = GlobalKey<FormState>();

  Stream<GenericoState> solicitarReembolsoState(
    ICompraController controller,
    PassagemAereaModel passagem,
    int idUsuario,
  ) async* {
    if (!formKey.currentState!.validate()) {
      return;
    }
    yield LoadingState();

    // DESCOMENTAR PARA FINALIZAR A INTEGRAÇÃO
    // final resultado = await controller.solicitarReembolso(
    //   CompraHerokuRemoteDatasource(),
    //   passagem,
    //   idUsuario,
    // );

    // yield resultado.fold(
    //   (erro) => FalhaState(erro),
    //   (booleano) {
    //     if (booleano) {
    //       return SucessoState('Reembolso solicitado com sucesso.');
    //     }
    //     return FalhaState('Erro ao solicitar reembolso');
    //   },
    // );

    // Comentar esta linha para finalizar a integração
    yield SucessoState('Sucesso');
  }

  void solicitarReembolso(
    BuildContext ctx,
    PassagemAereaModel passagem,
    int idUsuario,
  ) {
    solicitarReembolsoState(CompraController(), passagem, idUsuario).listen(
      (state) => StateHelper.listen(
        state,
        ctx,
        sucessoNavigate: () {
          Navigator.of(ctx).pushNamed(
            UsuarioRoutes.buscarPassagens,
          );
        },
      ),
    );
  }
}
