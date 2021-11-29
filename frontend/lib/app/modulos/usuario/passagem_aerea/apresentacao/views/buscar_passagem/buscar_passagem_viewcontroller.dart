import 'package:flutter/material.dart';

import '../../../../../../compartilhado/domain/helpers/dialog_helper.dart';
import '../../../../../../compartilhado/domain/helpers/snackbar_helper.dart';
import '../../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../dados/datasource/implementacao/passagem_aerea_heroku_remote_datasource.dart';
import '../../../dominio/controllers/implementacao/passagem_aerea_controller.dart';
import '../../../dominio/controllers/passagem_aerea_controller_interface.dart';
import '../../../dominio/validators/buscar_passagem_validator.dart';
import 'buscar_passagem_state.dart';

class BuscarPassagemViewcontroller {
  final ValueNotifier<bool> idaEVolta = ValueNotifier<bool>(true);
  final Map<String, ValueNotifier<DateTime?>> datasNotifier = {
    'ida': ValueNotifier<DateTime?>(null),
    'volta': ValueNotifier<DateTime?>(null),
  };
  final Map<String, dynamic> inputValores = {
    'origem': 'AJU',
    'destino': 'AJU',
    'passageiros': 1.0,
  };

  Stream<BuscarPassagemState> buscarPassagensState(
    IPassagemAereaController controller,
  ) async* {
    final validator = BuscarPassagemValidator();
    final mensagemErro = validator(
      datasNotifier['ida']!.value,
      datasNotifier['volta']!.value,
      idaEVolta.value,
    );
    if (mensagemErro != null) {
      yield FalhaState(mensagemErro);
      return;
    }

    yield LoadingState();

    final resultado = await controller.buscarPassagens(
      PassagemAereaHerokuRemoteDatasource(),
    );
    yield resultado.fold(
      (erro) => FalhaState(erro),
      (passagens) => SucessoState(passagens),
    );
  }

  void buscarPassagens(BuildContext ctx) {
    buscarPassagensState(
      PassagemAereaController(),
    ).listen((value) {
      if (value is LoadingState) {
        DialogHelper.exibirLoading(ctx);
      } else {
        DialogHelper.esconderDialog(ctx);
        if (value is FalhaState) {
          SnackBarHelper.exibirErro(ctx, value.mensagem);
        } else if (value is SucessoState) {
          Navigator.of(ctx).pushNamed(
            UsuarioRoutes.exibirPassagensBuscadas,
          );
          // passar as passagens como argumento para a próxima view
        }
      }
    });
  }
}
