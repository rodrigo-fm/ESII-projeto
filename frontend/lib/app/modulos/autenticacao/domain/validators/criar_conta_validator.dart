import 'package:flutter/material.dart';

class CriarContaValidator {
  bool call(
    GlobalKey<FormState> formKey,
    Map<String, TextEditingController> formControllers,
  ) {
    if (formKey.currentState!.validate()) {
      return false;
    }
    if (formControllers['senha']! != formControllers['confirmarSenha']!) {
      return false;
    }
    return true;
  }
}
