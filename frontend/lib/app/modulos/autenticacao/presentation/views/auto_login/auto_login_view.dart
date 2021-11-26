import 'package:flutter/material.dart';

import '../../../../usuario/passagem_aerea/apresentacao/views/buscar_passagem/buscar_passagem_view.dart';
import '../../../data/datasources/implementacoes/autenticacao_shared_preferences_local_datasource.dart';
import '../../../data/modelos/usuario_model.dart';
import '../../../domain/controllers/implementacoes/autenticacao_controller.dart';
import '../login/login_view.dart';

class AutoLoginView extends StatelessWidget {
  AutoLoginView({Key? key}) : super(key: key);
  final controller = AutenticacaoController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UsuarioModel?>(
      future: controller.autoLogin(
        context,
        AutenticacaoSharedPreferencesLocalDatasource(),
      ),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // return LoadingView();
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.data == null) {
          return const LoginView();
        } else {
          if (snapshot.data!.tipoUsuario == 'usuario') {
            return BuscarPassagemView();
          } else if (snapshot.data!.tipoUsuario == 'atendente-suporte') {
            return const Scaffold(body: Text('Tela do suporte'));
          }
        }
        return const LoginView();
      },
    );
  }
}
