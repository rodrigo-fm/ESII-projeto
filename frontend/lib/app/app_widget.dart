import 'package:aterrissar/app/modulos/atendente_suporte/pedidos_reembolso/apresentacao/views/detalhes_pedido_reembolso/detalhes_pedido_reembolso_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'compartilhado/domain/providers/autenticacao_provider.dart';
import 'compartilhado/presentation/routes/global_routes.dart';
import 'compartilhado/presentation/routes/suporte_routes.dart';
import 'compartilhado/presentation/routes/usuario_routes.dart';
import 'compartilhado/presentation/views/splash_screen/splash_screen_view.dart';
import 'modulos/atendente_suporte/configuracoes/apresentacao/views/menu_suporte/menu_suporte_view.dart';
import 'modulos/atendente_suporte/pedidos_reembolso/apresentacao/views/pedidos_reembolso/pedidos_reembolso_view.dart';
import 'modulos/autenticacao/presentation/views/auto_login/auto_login_view.dart';
import 'modulos/autenticacao/presentation/views/criar_conta/criar_conta_view.dart';
import 'modulos/autenticacao/presentation/views/login/login_view.dart';
import 'modulos/usuario/compra/apresentacao/views/confirmar_compra/confirmar_compra_view.dart';
import 'modulos/usuario/compra/apresentacao/views/escolher_assento/escolher_assento_view.dart';
import 'modulos/usuario/compra/apresentacao/views/exibir_normas_voo/exibir_normas_voo_view.dart';
import 'modulos/usuario/compra/apresentacao/views/inserir_dados_pagamento/inserir_dados_pagamento_view.dart';
import 'modulos/usuario/compra/apresentacao/views/inserir_dados_pessoais/inserir_dados_pessoais_view.dart';
import 'modulos/usuario/compra/dominio/provider/compra_provider.dart';
import 'modulos/usuario/configuracoes/apresentacao/views/menu_configuracao_usuario/menu_configuracao_usuario_view.dart';
import 'modulos/usuario/configuracoes/apresentacao/views/solicitar_reembolso/solicitar_reembolso_view.dart';
import 'modulos/usuario/configuracoes/apresentacao/views/visualizar_compras/visualizar_compras_view.dart';
import 'modulos/usuario/configuracoes/apresentacao/views/visualizar_dados_conta/visualizar_dados_conta_view.dart';
import 'modulos/usuario/passagem_aerea/apresentacao/views/buscar_passagem/buscar_passagem_view.dart';
import 'modulos/usuario/passagem_aerea/apresentacao/views/exibir_passagens_buscadas/exibir_passagens_buscadas_view.dart';
import 'modulos/usuario/suporte/apresentacao/views/pedir_suporte/pedir_suporte_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AutenticacaoProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CompraProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Aterrissar',
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
          GlobalRoutes.criarConta: (ctx) => CriarContaView(),
          GlobalRoutes.login: (ctx) => const LoginView(),
          GlobalRoutes.loading: (ctx) => const SplashScreenView(),
          UsuarioRoutes.buscarPassagens: (ctx) => BuscarPassagemView(),
          UsuarioRoutes.confirmarCompra: (ctx) => const ConfirmarCompraView(),
          UsuarioRoutes.exibirNormasVoo: (ctx) => ExibirNormasVooView(),
          UsuarioRoutes.inserirDadosPagamento: (ctx) =>
              InserirDadosPagamentoView(),
          // UsuarioRoutes.inserirDadosPassaporte: (ctx) =>
          //     InserirDadosPassaporteView(),
          UsuarioRoutes.inserirDadosPessoais: (ctx) =>
              InserirDadosPessoaisView(),
          UsuarioRoutes.escolherAssento: (ctx) => const EscolherAssentoView(),
          UsuarioRoutes.exibirPassagensBuscadas: (ctx) =>
              ExibirPassagensBuscadasView(),
          UsuarioRoutes.pedirSuporte: (ctx) => const PedirSuporteView(),
          UsuarioRoutes.menu: (ctx) => MenuConfiguracaoUsuarioView(),
          UsuarioRoutes.solicitarReembolso: (ctx) => SolicitarReembolsoView(),
          UsuarioRoutes.visualizarCompras: (ctx) => VisualizarComprasView(),
          UsuarioRoutes.visualizarDadosConta: (ctx) =>
              const VisualizarDadosContaView(),
          SuporteRoutes.detalhesPedido: (ctx) => DetalhesPedidoReembolsoView(),
          SuporteRoutes.menu: (ctx) => MenuConfiguracaoSuporteView(),
          SuporteRoutes.visualizarPedidos: (ctx) => PedidosReembolsoView(),
        },
        initialRoute: GlobalRoutes.autoLogin,
      ),
    );
  }
}
