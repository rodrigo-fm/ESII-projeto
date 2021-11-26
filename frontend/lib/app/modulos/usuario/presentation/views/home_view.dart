import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../compartilhado/domain/providers/autenticacao_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AutenticacaoProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Text('Home view: ${provider.usuario.email}'),
      ),
    );
  }
}
