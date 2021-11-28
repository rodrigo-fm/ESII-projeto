import 'package:flutter/material.dart';

import '../../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';

class EscolherAssentoView extends StatelessWidget {
  const EscolherAssentoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Escolher assento'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const Headline1('Etapa 3 de 3'),
          const Headline2('Escolher assento'),
          ElevatedButton(
            child: const BodyText1('Escolher'),
            onPressed: () {
              Navigator.of(context).pushNamed(UsuarioRoutes.confirmarCompra);
            },
          ),
        ],
      ),
    );
  }
}
