import 'package:flutter/material.dart';

import '../../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';

class ConfirmarCompraView extends StatelessWidget {
  const ConfirmarCompraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Confirmar compra'),
      ),
      body: ListView(
        children: [
          const Text(
            'Exibir informações da compra, para que o usuário possa corrigí-las',
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                UsuarioRoutes.exibirNormasVoo,
              );
            },
            child: const BodyText1('Confirmar'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const BodyText1('Cancelar'),
          ),
        ],
      ),
    );
  }
}
