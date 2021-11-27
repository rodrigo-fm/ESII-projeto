import 'package:aterrissar/app/modulos/usuario/passagem_aerea/apresentacao/views/confirmar_compra/confirmar_compra_view.dart';
import 'package:aterrissar/app/modulos/usuario/passagem_aerea/apresentacao/views/escolher_assento/escolher_assento_view.dart';
import 'package:aterrissar/app/modulos/usuario/passagem_aerea/apresentacao/views/inserir_dados_pagamento/inserir_dados_pagamento_view.dart';
import 'package:aterrissar/app/modulos/usuario/passagem_aerea/apresentacao/views/inserir_dados_passaporte/inserir_dados_passaporte_view.dart';
import 'package:aterrissar/app/modulos/usuario/passagem_aerea/apresentacao/views/inserir_dados_pessoais/inserir_dados_pessoais_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'compartilhado/domain/providers/autenticacao_provider.dart';
import 'compartilhado/presentation/routes/global_routes.dart';
import 'compartilhado/presentation/routes/usuario_routes.dart';
import 'compartilhado/presentation/views/splash_screen/splash_screen_view.dart';
import 'modulos/autenticacao/presentation/views/auto_login/auto_login_view.dart';
import 'modulos/autenticacao/presentation/views/login/login_view.dart';
import 'modulos/usuario/configuracoes/presentation/views/menu_configuracao_usuario/menu_configuracao_usuario_view.dart';
import 'modulos/usuario/passagem_aerea/apresentacao/views/buscar_passagem/buscar_passagem_view.dart';
import 'modulos/usuario/passagem_aerea/apresentacao/views/exibir_passagens_buscadas/exibir_passagens_buscadas_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AutenticacaoProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff0A0A0A),
            ),
            headline2: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: Color(0xff505050),
            ),
            headline3: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff747474),
            ),
            bodyText1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff747474),
            ),
          ),
        ),
        darkTheme: ThemeData(
          primaryColor: const Color(0xff9b009e),
          brightness: Brightness.dark,
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xffd1d1d1),
            ),
            headline2: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: Color(0xffd1d1d1),
            ),
            headline3: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xffd1d1d1),
            ),
            bodyText1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xffd1d1d1),
            ),
          ),
        ),
        themeMode: ThemeMode.dark,
        routes: {
          GlobalRoutes.autoLogin: (ctx) => AutoLoginView(),
          GlobalRoutes.login: (ctx) => const LoginView(),
          GlobalRoutes.loading: (ctx) => const SplashScreenView(),
          UsuarioRoutes.buscarPassagens: (ctx) => BuscarPassagemView(),
          UsuarioRoutes.confirmarCompra: (ctx) => const ConfirmarCompraView(),
          UsuarioRoutes.inserirDadosPagamento: (ctx) =>
              InserirDadosPagamentoView(),
          UsuarioRoutes.inserirDadosPassaporte: (ctx) =>
              InserirDadosPassaporteView(),
          UsuarioRoutes.inserirDadosPessoais: (ctx) =>
              InserirDadosPessoaisView(),
          UsuarioRoutes.escolherAssento: (ctx) => const EscolherAssentoView(),
          UsuarioRoutes.exibirPassagensBuscadas: (ctx) =>
              const ExibirPassagensBuscadasView(),
          UsuarioRoutes.menu: (ctx) => const MenuConfiguracaoUsuarioView(),
        },
        initialRoute: GlobalRoutes.autoLogin,
      ),
    );
  }
}