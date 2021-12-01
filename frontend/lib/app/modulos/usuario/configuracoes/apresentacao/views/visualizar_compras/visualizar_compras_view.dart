import 'package:dartz/dartz.dart';
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
      body: FutureBuilder<Either<String, List<PassagemAereaModel>>>(
        future: controller.resgatarCompras(
          CompraHerokuRemoteDatasource(),
          autenticacaoProvider.usuario.id,
        ),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return snapshot.data!.fold(
            (mensagem) => Center(
              child: Headline1(mensagem),
            ),
            (passagens) => ListView.builder(
              itemCount: passagens.length,
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
                // return Text(passagens[i].voo.companhiaAerea);
              },
            ),
          );
        },
      ),
    );
  }
}
