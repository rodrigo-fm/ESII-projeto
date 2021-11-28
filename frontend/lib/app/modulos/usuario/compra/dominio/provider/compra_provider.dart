import 'package:aterrissar/app/modulos/autenticacao/data/modelos/dados_pagamento_model.dart';
import 'package:aterrissar/app/modulos/autenticacao/data/modelos/dados_pessoais_model.dart';
// import 'package:aterrissar/app/modulos/autenticacao/data/modelos/passaporte_model.dart';
import 'package:flutter/material.dart';

class CompraProvider with ChangeNotifier {
  DadosPessoaisModel? dadosPessoais;
  DadosPagamentoModel? dadosPagamento;
  // PassaporteModel? passaporte;
  List<int>? assentosEscolhidos;
  Map<String, bool> salvarInformacao = {
    'dadosPessoais': false,
    'dadosPagamento': false,
    // 'passaporte': false,
  };

  void removerInformacoes() {
    assentosEscolhidos = null;
    dadosPessoais = null;
    dadosPagamento = null;
    // passaporte = null;
  }

  void adicionarDadosPagamento(
    Map<String, TextEditingController> inputValores,
  ) {
    dadosPagamento = DadosPagamentoModel(
      numero: inputValores['numeroCartao']!.text,
      titular: inputValores['nomeTitular']!.text,
      vencimento: inputValores['vencimento']!.text,
      cvv: inputValores['cvv']!.text,
    );
  }

  void adicionarDadosPessoais(
    Map<String, TextEditingController> inputValores,
  ) {
    dadosPessoais = DadosPessoaisModel(
      cpf: inputValores['cpf']!.text,
      rg: inputValores['rg']!.text,
    );
  }

  // void adicionarPassaporte(Map<String, dynamic> inputValores) {
  //   passaporte = PassaporteModel(dataEmissao: '', numero: '');
  // }
}
