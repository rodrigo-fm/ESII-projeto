import 'package:flutter/material.dart';

class InserirDadosPagamentoViewcontroller {
  final Map<String, TextEditingController> inputControllers = {
    'numeroCartao': TextEditingController(),
    'nomeTitular': TextEditingController(),
    'cvv': TextEditingController(),
    'vencimento': TextEditingController(),
  };
}
