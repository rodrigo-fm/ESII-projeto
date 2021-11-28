import 'package:aterrissar/app/compartilhado/presentation/widgets/textos_widget.dart';
import 'package:flutter/material.dart';

class SnackBarHelper {
  static void exibirErro(BuildContext ctx, String mensagem) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: BodyText1(
          mensagem,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  static void exibirSucesso(BuildContext ctx, String mensagem) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: BodyText1(mensagem),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
