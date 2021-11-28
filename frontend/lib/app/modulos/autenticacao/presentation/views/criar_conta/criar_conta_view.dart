import 'package:flutter/material.dart';

import '../../../../../compartilhado/presentation/routes/global_routes.dart';
import '../../../../../compartilhado/presentation/widgets/inputs_widget.dart';
import '../../../../../compartilhado/presentation/widgets/textos_widget.dart';
import 'criar_conta_viewcontroller.dart';

class CriarContaView extends StatelessWidget {
  CriarContaView({Key? key}) : super(key: key);
  final _viewcontroller = CriarContaViewcontroller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _viewcontroller.formKey,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              InputNome(
                controller: _viewcontroller.inputControllers['nome']!,
                label: 'Nome',
              ),
              InputEmail(
                controller: _viewcontroller.inputControllers['email']!,
              ),
              InputPassword(
                controller: _viewcontroller.inputControllers['senha']!,
              ),
              InputPassword(
                controller: _viewcontroller.inputControllers['confirmarSenha']!,
                label: 'Confirmar senha',
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                child: const BodyText1('Entrar'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  fixedSize: const Size(double.infinity, 45.0),
                ),
                onPressed: () => _viewcontroller.criarConta(context),
              ),
              const SizedBox(height: 15),
              TextButton(
                child: const BodyText1('Já possui uma conta? Entrar'),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                    GlobalRoutes.login,
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
