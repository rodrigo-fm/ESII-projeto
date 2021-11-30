import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../../../../compartilhado/presentation/widgets/passagem_aerea/passagem_aerea_busca_widget.dart';
import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';
import '../../../../compra/dominio/provider/compra_provider.dart';
import '../../../dados/datasource/implementacao/passagem_aerea_heroku_remote_datasource.dart';
import '../../../dados/modelos/passagem_aerea_model.dart';
import '../../../dominio/controllers/implementacao/passagem_aerea_controller.dart';
import 'widgets/informacoes_busca_passagem_widget.dart';

class ExibirPassagensBuscadasView extends StatelessWidget {
  ExibirPassagensBuscadasView({Key? key}) : super(key: key);
  final passagemController = PassagemAereaController();
  @override
  Widget build(BuildContext context) {
    final compraProvider = Provider.of<CompraProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Voos'),
      ),
      body: FutureBuilder<dartz.Either<String, List<PassagemAereaModel>>>(
        future: passagemController.buscarPassagens(
          PassagemAereaHerokuRemoteDatasource(),
        ),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return snapshot.data!.fold(
            (mensagemErro) => Center(
              child: Headline2(mensagemErro),
            ),
            (passagens) => ListView.builder(
              itemCount: 1 + passagens.length,
              itemBuilder: (ctx, i) {
                if (i == 0) {
                  return const InformacoesBuscaPassagemWidget();
                }
                int index = i - 1;
                return PassagemAereaBuscaWidget(
                  passagens[index],
                  textoBotao: 'Comprar',
                  onPressed: () {
                    compraProvider.passagemEscolhida = passagens[index];
                    Navigator.of(context).pushNamed(
                      UsuarioRoutes.inserirDadosPagamento,
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
