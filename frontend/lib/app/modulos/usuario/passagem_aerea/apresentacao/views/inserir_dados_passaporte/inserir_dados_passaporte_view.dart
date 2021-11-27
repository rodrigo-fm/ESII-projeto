import 'package:flutter/material.dart';

import '../../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../../../../compartilhado/presentation/widgets/inputs_widget.dart';
import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';

class InserirDadosPassaporteView extends StatelessWidget with ChangeNotifier {
  InserirDadosPassaporteView({Key? key}) : super(key: key);
  final ValueNotifier<bool> notifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Dados do passaporte'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          children: [
            const Headline1('Etapa 3 de 4'),
            const Headline2('Dados do passaporte'),
            // se já possuir dados pessoais cadastrados
            // exibir as informações dele ao invés do formulário
            InputNome(
              controller: TextEditingController(),
              label: 'Número do passaporte',
            ),
            InputNumero(
              controller: TextEditingController(),
              label: 'Data de emissão do passaporte',
            ),
            ValueListenableBuilder<bool>(
              valueListenable: notifier,
              builder: (ctxV, value, _) => CheckboxListTile(
                value: notifier.value,
                title: const BodyText1(
                    'Salvar dados do passaporte na minha conta'),
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
                  UsuarioRoutes.escolherAssento,
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
