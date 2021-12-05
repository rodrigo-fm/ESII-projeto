import 'package:flutter/material.dart';

import '../../../../../../compartilhado/domain/helpers/state_helper.dart';
import '../../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../../../../compartilhado/presentation/states/generico_state.dart';
import '../../../../../autenticacao/data/modelos/dados_pagamento_model.dart';
import '../../../dados/datasources/implementacoes/credenciais_heroku_remote_datasource.dart';
import '../../../dominio/controller/credenciais_controllers_interface.dart';
import '../../../dominio/controller/implementacoes/credenciais_controller.dart';

class InserirDadosPagamentoViewcontroller {
  final formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> inputControllers = {
    'numeroCartao': TextEditingController(),
    'nomeTitular': TextEditingController(),
    'cvv': TextEditingController(),
    'vencimento': TextEditingController(),
  };

  Stream<GenericoState> inserirDadosState(
    ICredenciaisController controller,
    int idUsuario,
  ) async* {
    if (!formKey.currentState!.validate()) {
      return;
    }
    yield LoadingState();

    final resultado = await controller.salvarDadosPagamento(
      CredenciaisHerokuRemoteDatasource(),
      DadosPagamentoModel(
        id: 0,
        numero: inputControllers['numeroCartao']!.text,
        titular: inputControllers['nomeTitular']!.text,
        vencimento: inputControllers['vencimento']!.text,
        cvv: inputControllers['cvv']!.text,
      ),
      idUsuario,
    );

    yield resultado.fold(
      (erro) => FalhaState(erro),
      (booleano) {
        if (booleano) {
          return SucessoState('Dados de pagamento registrados com sucesso.');
        }
        return FalhaState('Erro ao salvar dados de pagamento');
      },
    );
  }

  void inserirDados(BuildContext ctx, int idUsuario) {
    inserirDadosState(CredenciaisController(), idUsuario).listen(
      (state) => StateHelper.listen(
        state,
        ctx,
        sucessoNavigate: () {
          Navigator.of(ctx).pushNamed(
            UsuarioRoutes.inserirDadosPessoais,
          );
        },
      ),
    );
  }
}
