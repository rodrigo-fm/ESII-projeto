import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'textos_widget.dart';

class InputTexto extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final int? maxLength;
  final TextInputType? keyboardType;
  final int? maxLines;

  const InputTexto({
    Key? key,
    required this.controller,
    this.label,
    this.maxLength,
    this.keyboardType,
    this.maxLines,
  }) : super(key: key);

  String? validarTexto(String? valor) {
    if (valor!.isEmpty) {
      return 'Insira um valor neste campo';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        validator: validarTexto,
        maxLength: maxLength,
        maxLines: maxLines,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          label: BodyText1(label ?? ''),
        ),
      ),
    );
  }
}

class InputEmail extends StatelessWidget {
  final TextEditingController controller;
  final String? label;

  const InputEmail({
    Key? key,
    required this.controller,
    this.label,
  }) : super(key: key);

  String? validarEmail(String? valor) {
    if (valor!.isEmpty) {
      return 'Insira um valor neste campo';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(valor)) {
      return 'Por favor, insira um email válido';
    }
    return null;
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
    if (valor!.isEmpty) {
      return 'Insira um valor neste campo';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        validator: validarPassword,
        decoration: InputDecoration(
          label: BodyText1(label ?? 'Senha'),
          prefixIcon: const Icon(Icons.lock),
        ),
      ),
    );
  }
}

class InputNumero extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int? maxLength;
  const InputNumero({
    Key? key,
    required this.controller,
    required this.label,
    this.maxLength,
  }) : super(key: key);

  String? validarNumero(String? valor) {
    if (valor!.isEmpty) {
      return 'Insira um valor neste campo';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp('[0-9]'),
          ),
        ],
        maxLength: maxLength,
        validator: validarNumero,
        decoration: InputDecoration(
          label: BodyText1(label),
        ),
      ),
    );
  }
}

class InputNumeroCartao extends StatelessWidget {
  final TextEditingController controller;
  const InputNumeroCartao({
    Key? key,
    required this.controller,
  }) : super(key: key);

  String? validarNumero(String? valor) {
    if (valor!.isEmpty) {
      return 'Insira um valor neste campo';
    } else if (valor.length < 16) {
      return 'Número do cartão deve ter 16 dígitos';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp('[0-9]'),
          ),
        ],
        maxLength: 16,
        validator: validarNumero,
        decoration: const InputDecoration(
          label: BodyText1('Número do cartão'),
        ),
      ),
    );
  }
}

class InputNomeCartao extends StatelessWidget {
  final TextEditingController controller;
  const InputNomeCartao({
    Key? key,
    required this.controller,
  }) : super(key: key);

  String? validarNomeTitular(String? valor) {
    if (valor!.isEmpty) {
      return 'Insira um valor neste campo';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp('[a-z A-Z çÇ]'),
          ),
        ],
        validator: validarNomeTitular,
        decoration: const InputDecoration(
          label: BodyText1('Nome do titular'),
        ),
      ),
    );
  }
}

class InputNome extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int? maxLength;
  const InputNome({
    Key? key,
    required this.controller,
    required this.label,
    this.maxLength,
  }) : super(key: key);

  String? validarNomeTitular(String? valor) {
    if (valor!.isEmpty) {
      return 'Insira um valor neste campo';
    } else if (valor.contains(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]'))) {
      return 'Insira um nome válido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            // expressão regular que envolve letras maiúsculas, minúsculas e letras com acentos
            RegExp('[a-z A-Z \u00C0-\u00FF]'),
          ),
        ],
        validator: validarNomeTitular,
        decoration: InputDecoration(
          label: BodyText1(label),
        ),
      ),
    );
  }
}

class InputDropdown extends StatelessWidget {
  final List<String> opcoes;
  final String label;
  String retornarValor;
  final ValueNotifier<String?> opcaoEscolhida = ValueNotifier<String?>(null);

  InputDropdown({
    Key? key,
    required this.opcoes,
    required this.retornarValor,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyText1(label),
        ValueListenableBuilder<String?>(
          valueListenable: opcaoEscolhida,
          builder: (ctxV, value, _) => DropdownButton<String>(
            value: value ?? opcoes[0],
            onChanged: (String? valor) {
              opcaoEscolhida.value = valor;
              retornarValor = valor!;
            },
            items: opcoes
                .map((opcao) => DropdownMenuItem<String>(
                      value: opcao,
                      child: BodyText1(opcao),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
