import 'package:aterrissar/app/compartilhado/domain/helpers/state_helper.dart';
import 'package:aterrissar/app/compartilhado/presentation/routes/usuario_routes.dart';
import 'package:aterrissar/app/compartilhado/presentation/states/generico_state.dart';
import 'package:aterrissar/app/modulos/autenticacao/data/modelos/dados_pessoais_model.dart';
import 'package:aterrissar/app/modulos/usuario/compra/dados/datasources/implementacoes/credenciais_heroku_remote_datasource.dart';
import 'package:aterrissar/app/modulos/usuario/compra/dominio/controller/credenciais_controllers_interface.dart';
import 'package:aterrissar/app/modulos/usuario/compra/dominio/controller/implementacoes/credenciais_controller.dart';
import 'package:flutter/material.dart';

class InserirDadosPessoaisViewcontroller {
  final Map<String, TextEditingController> inputControllers = {
    'cpf': TextEditingController(),
    'rg': TextEditingController(),
  };
  final formKey = GlobalKey<FormState>();

  Stream<GenericoState> inserirDadosState(
    ICredenciaisController controller,
    int idUsuario,
  ) async* {
    if (!formKey.currentState!.validate()) {
      return;
    }
    yield LoadingState();

    // DESCOMENTAR ESTA LINHA PARA FINALIZAR A INTEGRAÇÃO
    final resultado = await controller.salvarDadosPessoais(
      CredenciaisHerokuRemoteDatasource(),
      DadosPessoaisModel(
        cpf: inputControllers['cpf']!.text,
        rg: inputControllers['rg']!.text,
      ),
      idUsuario,
    );

    yield resultado.fold(
      (erro) => FalhaState(erro),
      (booleano) {
        if (booleano) {
          return SucessoState('Dados pessoais registrados com sucesso.');
        }
        return FalhaState('Erro ao salvar dados pessoais');
      },
    );

    // DELETAR ESTA LINHA PARA FINALIZAR INTEGRAÇÃO
    // yield SucessoState('Sucesso');
  }

  void inserirDados(BuildContext ctx, int idUsuario) {
    inserirDadosState(CredenciaisController(), idUsuario).listen(
      (state) => StateHelper.listen(
        state,
        ctx,
        sucessoNavigate: () {
          Navigator.of(ctx).pushNamed(
            UsuarioRoutes.confirmarCompra,
          );
        },
      ),
    );
  }
}
