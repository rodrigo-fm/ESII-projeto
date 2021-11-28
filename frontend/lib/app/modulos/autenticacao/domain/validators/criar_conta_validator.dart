import 'package:flutter/material.dart';

class CriarContaValidator {
  String? call(
    GlobalKey<FormState> formKey,
    String senha,
    String confirmarSenha,
  ) {
    if (!formKey.currentState!.validate()) {
      return '';
    }
    if (senha != confirmarSenha) {
      return 'Os campos "Senha" e "Confirmar senha" apresentam valores diferentes';
    }
    return null;
  }
}
