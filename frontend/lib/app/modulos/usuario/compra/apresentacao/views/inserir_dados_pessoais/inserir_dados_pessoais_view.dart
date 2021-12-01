import 'package:aterrissar/app/modulos/autenticacao/data/modelos/dados_pessoais_model.dart';
import 'package:aterrissar/app/modulos/usuario/compra/dados/datasources/implementacoes/credenciais_heroku_remote_datasource.dart';
import 'package:aterrissar/app/modulos/usuario/compra/dominio/controller/implementacoes/credenciais_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dartz/dartz.dart' as dartz;

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
        title: const Headline3('Dados pessoais'),
      ),
      body: FutureBuilder<dartz.Either<String, DadosPessoaisModel>>(
          future: _controller.resgatarDadosPessoais(
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
                      const Headline1('Etapa 2 de 3'),
                      const Headline2('Dados pessoais'),
                      InputNumero(
                        controller: _viewcontroller.inputControllers['cpf']!,
                        label: 'CPF',
                        exactLength: 11,
                      ),
                      InputNumero(
                        controller: _viewcontroller.inputControllers['rg']!,
                        label: 'RG',
                        exactLength: 7,
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: notifier,
                        builder: (ctxV, value, _) => CheckboxListTile(
                          value: notifier.value,
                          title: const BodyText1(
                              'Salvar dados pessoais na minha conta'),
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
              (dadosPessoais) => ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Column(
                    children: [
                      const Headline1('Etapa 2 de 3'),
                      const Headline2('Dados pessoais'),
                      const SizedBox(height: 10),
                      BodyText1('rg: ${dadosPessoais.rg}'),
                      const SizedBox(height: 10),
                      BodyText1('cpf: ${dadosPessoais.cpf}'),
                      ElevatedButton(
                        child: const BodyText1('Avançar'),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            UsuarioRoutes.exibirNormasVoo,
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
                  ),
                ],
              ),
            );
          }),
    );
  }
}

    // final dadosPessoais = authProvider.usuario.dadosPessoais;
    // if (dadosPessoais != null) {
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: const Headline3('Dados pessoais'),
    //     ),
    //     body: Center(
    //       child: ListView(
    //         padding: const EdgeInsets.all(16),
    //         shrinkWrap: true,
    //         children: [
    //           const Headline1('Etapa 2 de 3'),
    //           const Headline2('Dados pessoais'),
    //           // ExibirInformacaoCartaoWidget(dadosPagamento),
    //           ElevatedButton(
    //             child: const BodyText1('Avançar'),
    //             onPressed: () {
    //               Navigator.of(context).pushNamed(
    //                 UsuarioRoutes.escolherAssento,
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