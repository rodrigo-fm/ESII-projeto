import 'package:aterrissar/app/compartilhado/domain/providers/autenticacao_provider.dart';
import 'package:aterrissar/app/compartilhado/presentation/routes/usuario_routes.dart';
import 'package:aterrissar/app/compartilhado/presentation/widgets/pedidos_suporte.dart/pedidos_reembolso_widget.dart';
import 'package:aterrissar/app/compartilhado/presentation/widgets/textos_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PedidosReembolsoView extends StatelessWidget {
  PedidosReembolsoView({Key? key}) : super(key: key);
  final controller = CompraController();

  @override
  Widget build(BuildContext context) {
    final autenticacaoProvider = Provider.of<AutenticacaoProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Pedidos de Reembolso'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PedidosReembolsoWidget(
            textoBotao: 'Detalhes reembolso',
            onPressed: () {
              Navigator.of(context).pushNamed(
                UsuarioRoutes
                    .solicitarReembolso, //TROCAR PARA SUPORTE -> DETALHESPEDIDO
              );
            },
          ),
          /*
          const SizedBox(height: 15),
          FutureBuilder<dartz.Either<String, List<PedidosReembolsoModel>>>(
            future: controller.historicoDeCompras(
              //autenticacaoProvider.usuario.id,
              CompraHerokuRemoteDatasource(),
            ),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data != null) {
                return snapshot.data!.fold(
                  (mensagemErro) => Center(
                    child: Headline2(mensagemErro),
                  ),
                  (passagens) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (ctxL, i) {
                      return PedidosReembolsoWidget(
                        //passagens[i],
                        textoBotao: 'Detalhes reembolso',
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            UsuarioRoutes
                                .solicitarReembolso, //TROCAR PARA SUPORTE -> DETALHESPEDIDO
                          );
                        },
                      );
                    },
                  ),
                );
              }
              return const Center(
                child: Headline2('Erro ao resgatar passagens'),
              );
            },
          ),*/
        ],
      ),
    );
  }
}

class CompraController {}
