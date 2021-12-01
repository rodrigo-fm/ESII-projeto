import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../../../../compartilhado/presentation/widgets/passagem_aerea/passagem_aerea_busca_widget.dart';
import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';
import '../../../../compra/dominio/provider/compra_provider.dart';
import '../../../dados/modelos/passagem_aerea_model.dart';
import '../../../dominio/controllers/implementacao/passagem_aerea_controller.dart';
import 'widgets/informacoes_busca_passagem_widget.dart';

class ExibirPassagensBuscadasView extends StatelessWidget {
  ExibirPassagensBuscadasView({Key? key}) : super(key: key);
  final passagemController = PassagemAereaController();
  @override
  Widget build(BuildContext context) {
    final compraProvider = Provider.of<CompraProvider>(context, listen: false);
    final argumentos =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List<PassagemAereaModel> passagens = argumentos['passagens'];
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Voos'),
      ),
      body: ListView.builder(
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
  }
}
