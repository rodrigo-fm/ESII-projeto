import 'package:aterrissar/app/compartilhado/domain/providers/autenticacao_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';
import 'exibir_normais_voo_viewcontroller.dart';

class ExibirNormasVooView extends StatelessWidget {
  ExibirNormasVooView({Key? key}) : super(key: key);
  final _viewcontroller = ExibirNormasVooViewcontroller();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AutenticacaoProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Normas para voos'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const BodyText1('Aqui estão os termos e condutas para voos'),
          const Headline2('Voos internacionais'),
          const BodyText1(
              'Aqui estão termos específicos para voos internacionais'),
          ElevatedButton(
            onPressed: () {
              _viewcontroller.comprar(
                context,
                authProvider.usuario.id,
              );
            },
            child: const BodyText1('Li e estou de acordo com as normas'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                UsuarioRoutes.buscarPassagens,
              );
            },
            child: const BodyText1('Não estou de acordo com as normas'),
          ),
        ],
      ),
    );
  }
}
