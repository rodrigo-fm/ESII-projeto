import 'package:aterrissar/app/compartilhado/presentation/widgets/inputs_widget.dart';
import 'package:aterrissar/app/compartilhado/presentation/widgets/textos_widget.dart';
import 'package:flutter/material.dart';

class SolicitarReembolsoView extends StatelessWidget {
  SolicitarReembolsoView({Key? key}) : super(key: key);
  final _motivoReembolso = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Solicitar reembolso'),
      ),
      body: Form(
        key: _formKey,
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
              onPressed: () {},
              child: const BodyText1('Solicitar reembolso'),
            ),
          ],
        ),
      ),
    );
  }
}
