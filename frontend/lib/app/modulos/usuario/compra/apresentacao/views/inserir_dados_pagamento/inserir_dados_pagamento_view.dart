import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dartz/dartz.dart' as dartz;

import '../../../../../../compartilhado/domain/providers/autenticacao_provider.dart';
import '../../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../../../../compartilhado/presentation/widgets/inputs_widget.dart';
import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';
import '../../../../../autenticacao/data/modelos/dados_pagamento_model.dart';
import '../../../dados/datasources/implementacoes/credenciais_heroku_remote_datasource.dart';
import '../../../dominio/controller/implementacoes/credenciais_controller.dart';
import '../../../dominio/provider/compra_provider.dart';
import 'inserir_dados_pagamento_viewcontroller.dart';
import 'widgets/exibir_informacao_cartao_widget.dart';

class InserirDadosPagamentoView extends StatelessWidget with ChangeNotifier {
  InserirDadosPagamentoView({Key? key}) : super(key: key);
  final ValueNotifier<bool> notifier = ValueNotifier<bool>(false);
  final _viewcontroller = InserirDadosPagamentoViewcontroller();
  final _controller = CredenciaisController();

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
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Dados pagamento'),
      ),
      body: FutureBuilder<dartz.Either<String, List<DadosPagamentoModel>>>(
        future: _controller.resgatarDadosPagamento(
          CredenciaisHerokuRemoteDatasource(),
          authProvider.usuario.id,
        ),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return snapshot.data!.fold(
            (_) => Form(
              key: _viewcontroller.formKey,
              child: Center(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: [
                    const Headline1('Etapa 1 de 3'),
                    const Headline2('Dados de pagamento'),
                    InputNumeroCartao(
                      controller:
                          _viewcontroller.inputControllers['numeroCartao']!,
                    ),
                    InputNomeCartao(
                      controller:
                          _viewcontroller.inputControllers['nomeTitular']!,
                    ),
                    InputNumero(
                      controller: _viewcontroller.inputControllers['cvv']!,
                      label: 'CVV',
                      maxLength: 3,
                    ),
                    InputNumero(
                      controller:
                          _viewcontroller.inputControllers['vencimento']!,
                      label: 'Vencimento',
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: notifier,
                      builder: (ctxV, value, _) => CheckboxListTile(
                        value: notifier.value,
                        title: const BodyText1(
                          'Salvar dados de pagamento na minha conta',
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (valor) {
                          notifier.value = !notifier.value;
                          compraProvider.salvarInformacao['dadosPagamento'] =
                              notifier.value;
                          notifier.notifyListeners();
                        },
                      ),
                    ),
                    ElevatedButton(
                      child: const BodyText1('Avançar'),
                      onPressed: () {
                        _viewcontroller.inserirDados(
                          context,
                          authProvider.usuario.id,
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
            (dadosPagamento) => ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: dadosPagamento.length,
              itemBuilder: (ctxL, i) {
                return Column(
                  children: [
                    const Headline1('Etapa 1 de 3'),
                    const Headline2('Dados de pagamento'),
                    const SizedBox(height: 10),
                    ExibirInformacaoCartaoWidget(dadosPagamento[i]),
                    const SizedBox(height: 10),
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
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                          UsuarioRoutes.buscarPassagens,
                        );
                      },
                    ),
                    const SizedBox(height: 25),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

    // if (dadosPagamento != null) {
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: const Headline3('Dados pagamento'),
    //     ),
    //     body: Center(
    //       child: ListView(
    //         padding: const EdgeInsets.all(16),
    //         shrinkWrap: true,
    //         children: [
    //           const Headline1('Etapa 1 de 3'),
    //           const Headline2('Dados de pagamento'),
    //           ExibirInformacaoCartaoWidget(dadosPagamento),
    //           ElevatedButton(
    //             child: const BodyText1('Avançar'),
    //             onPressed: () {
    //               Navigator.of(context).pushNamed(
    //                 UsuarioRoutes.inserirDadosPessoais,
    //               );
    //             },
    //           ),
    //           ElevatedButton(
    //             child: const BodyText1('Cancelar compra'),
    //             onPressed: () {},
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }