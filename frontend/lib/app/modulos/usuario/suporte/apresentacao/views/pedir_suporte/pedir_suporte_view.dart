import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';
import 'package:flutter/material.dart';

class PedirSuporteView extends StatelessWidget {
  const PedirSuporteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Suporte'),
      ),
      body: ListView(
        children: const [
          Text('Exibir tela pedir suporte'),
        ],
      ),
    );
  }
}
