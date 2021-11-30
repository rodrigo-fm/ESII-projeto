import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../compartilhado/domain/providers/autenticacao_provider.dart';
import '../../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../../../../compartilhado/presentation/widgets/passagem_aerea/passagem_aerea_busca_widget.dart';
import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';
import '../../../../compra/dados/datasources/implementacoes/compra_heroku_remote_datasource.dart';
import '../../../../compra/dominio/controller/implementacoes/compra_controller.dart';
import '../../../../passagem_aerea/dados/modelos/passagem_aerea_model.dart';

class VisualizarComprasView extends StatelessWidget {
  VisualizarComprasView({Key? key}) : super(key: key);
  final controller = CompraController();

  @override
  Widget build(BuildContext context) {
    final autenticacaoProvider = Provider.of<AutenticacaoProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Minhas compras'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Headline1('Minhas compras'),
          const SizedBox(height: 15),
          FutureBuilder<dartz.Either<String, List<PassagemAereaModel>>>(
            future: controller.historicoDeCompras(
              autenticacaoProvider.usuario.id,
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
                      return PassagemAereaBuscaWidget(
                        passagens[i],
                        textoBotao: 'Solicitar reembolso',
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            UsuarioRoutes.solicitarReembolso,
                            arguments: {
                              'passagem': passagens[i],
                            },
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
          ),
        ],
      ),
    );
  }
}
