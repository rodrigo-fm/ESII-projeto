import 'package:aterrissar/app/compartilhado/presentation/routes/usuario_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../compartilhado/domain/providers/autenticacao_provider.dart';
import '../../../../../../compartilhado/presentation/widgets/menu_configuracao/menu_configuracao_list_tile_widget.dart';
import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';

class MenuConfiguracaoUsuarioView extends StatelessWidget {
  const MenuConfiguracaoUsuarioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final autenticacaoProvider =
        Provider.of<AutenticacaoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Headline3('Meu perfil')),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Headline1('Olá, ${autenticacaoProvider.usuario.nome}'),
                const SizedBox(height: 20),
                const Divider(
                  thickness: 2,
                  color: Color(0xffc0c0c0),
                ),
                MenuConfiguracaoListTileWidget(
                  icone: const Icon(Icons.cake),
                  opcao: 'Dados da conta',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      UsuarioRoutes.visualizarDadosConta,
                    );
                  },
                ),
                MenuConfiguracaoListTileWidget(
                  icone: const Icon(Icons.cake),
                  opcao: 'Histórico de compras',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      UsuarioRoutes.visualizarCompras,
                    );
                  },
                ),
                MenuConfiguracaoListTileWidget(
                  icone: const Icon(Icons.cake),
                  opcao: 'Pedir suporte',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      UsuarioRoutes.pedirSuporte,
                    );
                  },
                ),
                MenuConfiguracaoListTileWidget(
                  icone: const Icon(Icons.cake),
                  opcao: 'Sair',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
