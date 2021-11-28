import 'package:flutter/material.dart';

import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';

class VisualizarDadosContaView extends StatelessWidget {
  const VisualizarDadosContaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Meus dados'),
      ),
      body: ListView(
        children: const [
          Text('Exibir dados do usuário'),
        ],
      ),
    );
  }
}
