import 'package:flutter/material.dart';

import '../../presentation/widgets/dialogs/loading_dialog_widget.dart';

class DialogHelper {
  static bool dialogExibido = false;

  static void exibirLoading(BuildContext ctx) {
    if (!DialogHelper.dialogExibido) {
      DialogHelper.dialogExibido = true;
      showDialog(
        context: ctx,
        builder: (ctx) => const LoadingDialogWidget(),
      );
    }
  }

  static void esconderDialog(BuildContext ctx) {
    if (DialogHelper.dialogExibido) {
      Navigator.of(ctx).pop();
      DialogHelper.dialogExibido = false;
    }
  }
}
