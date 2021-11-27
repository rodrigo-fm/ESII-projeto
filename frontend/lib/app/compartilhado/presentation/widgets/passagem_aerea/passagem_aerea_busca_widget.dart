import 'package:flutter/material.dart';

import '../../routes/usuario_routes.dart';
import '../textos_widget.dart';

class PassagemAereaBuscaWidget extends StatelessWidget {
  const PassagemAereaBuscaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String constante = 'Companhia aérea';
    int valor = 500;
    // TODO: colocar borda arredondada neste componente
    return Container(
      color: Colors.grey[700],
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      child: Column(
        children: [
          Headline2(constante),
          const Divider(thickness: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BodyText1('Ida $constante'),
              const BodyText1('Volta'),
            ],
          ),
          const Divider(thickness: 2),
          Headline3('Valor: $valor'),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                UsuarioRoutes.inserirDadosPagamento,
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            child: const BodyText1('Comprar'),
          ),
        ],
      ),
    );
  }
}
