import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:aterrissar/app/modulos/usuario/passagem_aerea/dados/modelos/passagem_aerea_model.dart';

import '../../routes/usuario_routes.dart';
import '../textos_widget.dart';

class PassagemAereaBuscaWidget extends StatelessWidget {
  final PassagemAereaModel passagem;
  const PassagemAereaBuscaWidget(
    this.passagem, {
    Key? key,
  }) : super(key: key);

  String formatarData(DateTime data) {
    return DateFormat('dd/MM HH:ss').format(data);
  }

  String calcularVolta(DateTime dataPartida) {
    DateTime horarioVolta =
        dataPartida.add(Duration(minutes: passagem.voo.duracao));
    return DateFormat('dd/MM HH:ss').format(horarioVolta);
  }

  String formatarPreco(double valor) {
    return 'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';
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
            child: Headline2(passagem.voo.companhiaAerea),
          ),
          const Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BodyText1('Ida ${formatarData(passagem.voo.dataPartida)}'),
                const VerticalDivider(thickness: 2, color: Colors.white),
                BodyText1('Volta: ${calcularVolta(passagem.voo.dataPartida)} '),
              ],
            ),
          ),
          const Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Headline3('Valor: ${formatarPreco(passagem.preco)}'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                UsuarioRoutes.inserirDadosPagamento,
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            child: const BodyText1('Comprar'),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
