import 'package:aterrissar/app/compartilhado/presentation/routes/usuario_routes.dart';
import 'package:aterrissar/app/compartilhado/presentation/widgets/inputs_widget.dart';
import 'package:aterrissar/app/compartilhado/presentation/widgets/textos_widget.dart';
import 'package:flutter/material.dart';

class InserirDadosPessoaisView extends StatelessWidget with ChangeNotifier {
  InserirDadosPessoaisView({Key? key}) : super(key: key);
  final ValueNotifier<bool> notifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Dados pessoais'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          children: [
            const Headline1('Etapa 2 de 4'),
            const Headline2('Dados pessoais'),
            // se já possuir dados pessoais cadastrados
            // exibir as informações dele ao invés do formulário
            InputNome(
              controller: TextEditingController(),
              label: 'Nome completo',
            ),
            InputNumero(
              controller: TextEditingController(),
              label: 'CPF',
            ),
            InputNumero(
              controller: TextEditingController(),
              label: 'RG',
            ),
            ValueListenableBuilder<bool>(
              valueListenable: notifier,
              builder: (ctxV, value, _) => CheckboxListTile(
                value: notifier.value,
                title: const BodyText1('Salvar dados pessoais na minha conta'),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (valor) {
                  notifier.value = !notifier.value;
                  notifier.notifyListeners();
                },
              ),
            ),
            ElevatedButton(
              child: const BodyText1('Avançar'),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  UsuarioRoutes.inserirDadosPessoais,
                );
              },
            ),
            ElevatedButton(
              child: const BodyText1('Cancelar compra'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
