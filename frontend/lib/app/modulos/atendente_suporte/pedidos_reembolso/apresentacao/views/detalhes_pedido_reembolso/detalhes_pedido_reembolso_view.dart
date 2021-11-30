import 'package:aterrissar/app/modulos/atendente_suporte/pedidos_reembolso/dados/modelo/pedidos_reembolso_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';
import 'detalhes_pedido_reembolso_viewcontroller.dart';

class DetalhesPedidoReembolsoView extends StatelessWidget {
  DetalhesPedidoReembolsoView({Key? key}) : super(key: key);
  final _viewcontroller = DetalhesPedidoReembolsoViewcontroller();

  @override
  Widget build(BuildContext context) {
    final argumentos =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    PedidoReembolsoModel pedido = argumentos['pedido'];
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Detalhes do pedido'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () {
              _viewcontroller.avaliarReembolso(context, true, pedido);
            },
            child: const BodyText1('Aprovar'),
          ),
          ElevatedButton(
            onPressed: () {
              _viewcontroller.avaliarReembolso(context, false, pedido);
            },
            child: const BodyText1('Rejeitar'),
          ),
        ],
      ),
    );
  }
}
