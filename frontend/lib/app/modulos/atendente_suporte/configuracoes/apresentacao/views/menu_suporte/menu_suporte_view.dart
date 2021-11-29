import 'package:aterrissar/app/compartilhado/presentation/widgets/menu_configuracao/menu_configuracao_list_tile_usuario.dart';
import 'package:aterrissar/app/compartilhado/presentation/widgets/menu_configuracao/menu_configuracao_list_tile_widget.dart';
import 'package:aterrissar/app/compartilhado/presentation/widgets/textos_widget.dart';
import 'package:aterrissar/app/modulos/usuario/configuracoes/presentation/views/menu_configuracao_usuario/menu_configuracao_usuario_viewcontroller.dart';
import 'package:flutter/material.dart';

//import 'menu_configuracao_usuario_viewcontroller.dart';

class MenuConfiguracaoSuporteView extends StatelessWidget {
  MenuConfiguracaoSuporteView({Key? key}) : super(key: key);
  final viewcontroller = MenuConfiguracaoUsuarioViewcontroller();

  @override
  Widget build(BuildContext context) {
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
                const Headline1('Olá, suporte'), //PEGAR NOME DO SUPORTE
                const MenuConfiguracaoListTileUsuario(
                    email: 'email@email.com'), //PEGAR EMAIL DO SUPORTE
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
