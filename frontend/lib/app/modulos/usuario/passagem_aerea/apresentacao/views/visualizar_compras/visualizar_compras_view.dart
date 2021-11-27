import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';
import 'package:flutter/material.dart';

class VisualizarComprasView extends StatelessWidget {
  const VisualizarComprasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Minhas compras'),
      ),
      body: ListView(
        children: const [Text('Exibir compras do usuário')],
      ),
    );
  }
}
