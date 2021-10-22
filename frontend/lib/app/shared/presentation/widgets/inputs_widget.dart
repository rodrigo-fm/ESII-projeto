import 'package:flutter/material.dart';

import 'textos_widget.dart';

class InputEmail extends StatelessWidget {
  final TextEditingController controller;
  final String? label;

  const InputEmail({
    Key? key,
    required this.controller,
    this.label,
  }) : super(key: key);

  String? validarEmail(String? valor) {
    if (valor == null) {
      return 'Insira um valor neste campo';
    }
    // TODO: adicionar expressão regular para checar se é um email
    // if email inválido retorne erro
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        validator: validarEmail,
        decoration: const InputDecoration(
          label: BodyText1('Email'),
          prefixIcon: Icon(Icons.person),
        ),
      ),
    );
  }
}

class InputPassword extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  const InputPassword({
    Key? key,
    required this.controller,
    this.label,
  }) : super(key: key);

  String? validarPassword(String? valor) {
    if (valor == null) {
      return 'Insira um valor neste campo';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        validator: validarPassword,
        decoration: const InputDecoration(
          label: BodyText1('Senha'),
          prefixIcon: Icon(Icons.lock),
        ),
      ),
    );
  }
}
