import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../compartilhado/domain/providers/autenticacao_provider.dart';
import '../../../../../../compartilhado/presentation/widgets/inputs_widget.dart';
import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';
import '../../../../passagem_aerea/dados/modelos/passagem_aerea_model.dart';
import 'solicitar_reembolso_viewcontroller.dart';

class SolicitarReembolsoView extends StatelessWidget {
  SolicitarReembolsoView({Key? key}) : super(key: key);
  final _motivoReembolso = TextEditingController();
  final _viewcontroller = SolicitarReembolsoViewcontroller();

  @override
  Widget build(BuildContext context) {
    final argumentos =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    PassagemAereaModel passagem = argumentos['passagem'];

    final authProvider = Provider.of<AutenticacaoProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Solicitar reembolso'),
      ),
      body: Form(
        key: _viewcontroller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Headline1('Solicitação de reembolso'),
            const Headline3('Informe abaixo o motivo do seu reembolso'),
            InputTexto(
              controller: _motivoReembolso,
              label: 'Motivo de reembolso',
              keyboardType: TextInputType.multiline,
              maxLength: 255,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => _viewcontroller.solicitarReembolso(
                context,
                passagem,
                authProvider.usuario.id,
              ),
              child: const BodyText1('Solicitar reembolso'),
            ),
          ],
        ),
      ),
    );
  }
}
