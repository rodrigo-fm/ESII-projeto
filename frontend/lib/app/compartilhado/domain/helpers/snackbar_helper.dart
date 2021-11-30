import 'package:aterrissar/app/compartilhado/presentation/widgets/textos_widget.dart';
import 'package:flutter/material.dart';

class SnackBarHelper {
  static const duracaoSnackbar = 4;

  static void exibirErro(BuildContext ctx, String mensagem) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: BodyText1(
          mensagem,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: SnackBarHelper.duracaoSnackbar),
      ),
    );
  }

  static void exibirSucesso(BuildContext ctx, String mensagem) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: BodyText1(
          mensagem,
          color: Colors.black,
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: SnackBarHelper.duracaoSnackbar),
      ),
    );
  }
}
