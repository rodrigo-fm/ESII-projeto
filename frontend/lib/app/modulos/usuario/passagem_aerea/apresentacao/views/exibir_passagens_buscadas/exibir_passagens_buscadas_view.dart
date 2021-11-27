import 'package:aterrissar/app/compartilhado/presentation/widgets/passagem_aerea/passagem_aerea_busca_widget.dart';
import 'package:aterrissar/app/compartilhado/presentation/widgets/textos_widget.dart';
import 'package:flutter/material.dart';

class ExibirPassagensBuscadasView extends StatelessWidget {
  const ExibirPassagensBuscadasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> passagens = [1, 2, 3];
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Voos'),
      ),
      body: ListView.builder(
        itemCount: 1 + passagens.length,
        itemBuilder: (ctx, i) {
          if (i == 0) {
            return const Text('informações da busca');
          }
          return const PassagemAereaBuscaWidget();
        },
      ),
    );
  }
}
