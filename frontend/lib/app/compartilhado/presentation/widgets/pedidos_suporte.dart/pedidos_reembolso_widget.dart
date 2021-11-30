import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../modulos/atendente_suporte/pedidos_reembolso/dados/modelo/pedidos_reembolso_model.dart';
import '../../routes/usuario_routes.dart';
import '../textos_widget.dart';

class PedidosReembolsoWidget extends StatelessWidget {
  final PedidoReembolsoModel pedido;
  final Function() onPressed;
  final String textoBotao;

  const PedidosReembolsoWidget({
    required this.pedido,
    required this.onPressed,
    required this.textoBotao,
    Key? key,
  }) : super(key: key);

  String formatarData(DateTime data) {
    return DateFormat('dd/MM HH:ss').format(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.grey[700],
      ),
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Headline2('Email do cliente: '),
                BodyText1('email@email.com')
              ],
            ),
          ),
          const Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Headline2('ID do pedido: '),
                const VerticalDivider(thickness: 2, color: Colors.white),
                BodyText1('1321313131'),
              ],
            ),
          ),
          const Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Headline2('Data: '),
                const VerticalDivider(thickness: 2, color: Colors.white),
                BodyText1('20/10/2021'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            child: BodyText1(textoBotao),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
