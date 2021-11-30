import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../compartilhado/domain/providers/autenticacao_provider.dart';
import '../../../../../../compartilhado/presentation/widgets/menu_configuracao/menu_configuracao_list_tile_usuario.dart';
import '../../../../../../compartilhado/presentation/widgets/menu_configuracao/menu_configuracao_list_tile_widget.dart';
import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';
import 'menu_suporte_viewcontroller.dart';

//import 'menu_configuracao_usuario_viewcontroller.dart';

class MenuConfiguracaoSuporteView extends StatelessWidget {
  MenuConfiguracaoSuporteView({Key? key}) : super(key: key);
  final viewcontroller = MenuConfiguracaoSuporteViewcontroller();

  @override
  Widget build(BuildContext context) {
    final autenticacaoProvider = Provider.of<AutenticacaoProvider>(
      context,
      listen: false,
    );
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
                MenuConfiguracaoListTileUsuario(
                  email: autenticacaoProvider.usuario.email,
                ),
                const SizedBox(height: 20),
                const Divider(
                  thickness: 2,
                  color: Color(0xffc0c0c0),
                ),
                MenuConfiguracaoListTileWidget(
                  icone: const Icon(Icons.cake),
                  opcao: 'Sair',
                  onTap: () async {
                    await viewcontroller.logout(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
