import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../compartilhado/domain/providers/autenticacao_provider.dart';
import '../../../dominio/provider/compra_provider.dart';
import '../../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../../../../compartilhado/presentation/widgets/inputs_widget.dart';
import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';
import 'inserir_dados_pessoais_viewcontroller.dart';

class InserirDadosPessoaisView extends StatelessWidget with ChangeNotifier {
  InserirDadosPessoaisView({Key? key}) : super(key: key);
  final ValueNotifier<bool> notifier = ValueNotifier<bool>(false);
  final _viewcontroller = InserirDadosPessoaisViewcontroller();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AutenticacaoProvider>(
      context,
      listen: false,
    );
    final compraProvider = Provider.of<CompraProvider>(
      context,
      listen: false,
    );
    final dadosPessoais = authProvider.usuario.dadosPessoais;
    if (dadosPessoais != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Headline3('Dados pessoais'),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              const Headline1('Etapa 2 de 3'),
              const Headline2('Dados pessoais'),
              // ExibirInformacaoCartaoWidget(dadosPagamento),
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
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Dados pessoais'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              const Headline1('Etapa 2 de 3'),
              const Headline2('Dados pessoais'),
              // se já possuir dados pessoais cadastrados
              // exibir as informações dele ao invés do formulário
              // InputNome(
              //   controller: TextEditingController(),
              //   label: 'Nome completo',
              // ),
              InputNumero(
                controller: _viewcontroller.inputControllers['cpf']!,
                label: 'CPF',
                maxLength: 11,
              ),
              InputNumero(
                controller: _viewcontroller.inputControllers['rg']!,
                label: 'RG',
                maxLength: 7,
              ),
              ValueListenableBuilder<bool>(
                valueListenable: notifier,
                builder: (ctxV, value, _) => CheckboxListTile(
                  value: notifier.value,
                  title:
                      const BodyText1('Salvar dados pessoais na minha conta'),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (valor) {
                    notifier.value = !notifier.value;
                    compraProvider.salvarInformacao['dadosPessoais'] =
                        notifier.value;
                    notifier.notifyListeners();
                  },
                ),
              ),
              ElevatedButton(
                child: const BodyText1('Avançar'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    compraProvider.adicionarDadosPessoais(
                      _viewcontroller.inputControllers,
                    );
                  }
                  Navigator.of(context).pushNamed(
                    UsuarioRoutes.escolherAssento,
                  );
                },
              ),
              ElevatedButton(
                child: const BodyText1('Cancelar compra'),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                    UsuarioRoutes.buscarPassagens,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
