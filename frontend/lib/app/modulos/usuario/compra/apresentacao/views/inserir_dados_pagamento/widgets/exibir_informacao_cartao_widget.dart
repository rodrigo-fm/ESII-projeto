import 'package:aterrissar/app/compartilhado/presentation/widgets/textos_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../autenticacao/data/modelos/dados_pagamento_model.dart';

class ExibirInformacaoCartaoWidget extends StatelessWidget {
  final DadosPagamentoModel dadosPagamento;
  const ExibirInformacaoCartaoWidget(
    this.dadosPagamento, {
    Key? key,
  }) : super(key: key);

  String ultimos4Digitos() {
    return dadosPagamento.numero.substring(11);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: Colors.white),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Headline3('Cartão de crédito'),
          Headline3('Termina em ${ultimos4Digitos()}'),
        ],
      ),
    );
  }
}
