import 'package:flutter/material.dart';

import '../../../../modulos/autenticacao/data/modelos/dados_pessoais_model.dart';
import '../../routes/usuario_routes.dart';
import '../textos_widget.dart';

class ExibirDadosPessoaisWidget extends StatelessWidget {
  final DadosPessoaisModel dadosPessoais;
  const ExibirDadosPessoaisWidget({
    Key? key,
    required this.dadosPessoais,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyText1('rg: ${dadosPessoais.rg}'),
        const SizedBox(height: 10),
        BodyText1('cpf: ${dadosPessoais.cpf}'),
        const SizedBox(height: 25),
      ],
    );
  }
}
