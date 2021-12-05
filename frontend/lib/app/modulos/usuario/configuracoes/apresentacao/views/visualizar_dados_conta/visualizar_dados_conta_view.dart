import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../compartilhado/domain/providers/autenticacao_provider.dart';
import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';
import '../../../../../autenticacao/data/modelos/dados_pagamento_model.dart';
import '../../../../../autenticacao/data/modelos/dados_pessoais_model.dart';
import '../../../../compra/dados/datasources/implementacoes/credenciais_heroku_remote_datasource.dart';
import '../../../../compra/dominio/controller/implementacoes/credenciais_controller.dart';

class VisualizarDadosContaView extends StatelessWidget {
  VisualizarDadosContaView({Key? key}) : super(key: key);
  final controller = CredenciaisController();

  @override
  Widget build(BuildContext context) {
    final autenticacaoProvider = Provider.of<AutenticacaoProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Headline3('Meus dados'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          FutureBuilder<Either<String, DadosPessoaisModel>>(
            future: controller.resgatarDadosPessoais(
              CredenciaisHerokuRemoteDatasource(),
              autenticacaoProvider.usuario.id,
            ),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Headline3('Carregando...');
              }
              return snapshot.data!.fold(
                (mensagemErro) => Headline2(mensagemErro),
                (dadosPessoais) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Headline2('Dados pessoais'),
                    BodyText1('Rg: ${dadosPessoais.rg}'),
                    const SizedBox(height: 10),
                    BodyText1('Cpf: ${dadosPessoais.cpf}'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const BodyText1(
                        'Excluir dados pessoais',
                        color: Colors.black,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              );
            },
          ),
          FutureBuilder<Either<String, List<DadosPagamentoModel>>>(
            future: controller.resgatarDadosPagamento(
              CredenciaisHerokuRemoteDatasource(),
              autenticacaoProvider.usuario.id,
            ),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Headline3('carregando...');
              }
              return snapshot.data!.fold(
                (mensagemErro) => Headline2(mensagemErro),
                (dadosPagamento) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Headline3('Cartões de crédito'),
                    ListView.builder(
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemCount: dadosPagamento.length,
                      itemBuilder: (ctxLB, i) {
                        final cartao = dadosPagamento[i];
                        return ListTile(
                          leading: BodyText1(
                            'Cartão de crédito, termina em: ${cartao.numeroCensurado}',
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {},
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
