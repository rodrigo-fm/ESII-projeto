import 'package:aterrissar/app/compartilhado/domain/helpers/snackbar_helper.dart';
import 'package:flutter/material.dart';

import '../../presentation/states/generico_state.dart';
import 'dialog_helper.dart';

class StateHelper {
  static void listen(
    GenericoState state,
    BuildContext ctx, {
    Function()? sucessoNavigate,
  }) {
    if (state is LoadingState) {
      DialogHelper.exibirLoading(ctx);
    } else {
      DialogHelper.esconderDialog(ctx);
      if (state is FalhaState) {
        SnackBarHelper.exibirErro(ctx, state.mensagem);
      } else if (state is SucessoState) {
        SnackBarHelper.exibirSucesso(ctx, state.mensagem);
        if (sucessoNavigate != null) {
          sucessoNavigate();
        }
      }
    }
  }

  // static Stream<GenericoState> usecase({
  //   required Function() usecase,
  // }) async* {
  //   yield LoadingState();
  // }
}
