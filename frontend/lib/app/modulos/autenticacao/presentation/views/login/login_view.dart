import 'package:flutter/material.dart';

import '../../../../../compartilhado/presentation/widgets/inputs_widget.dart';
import '../../../../../compartilhado/presentation/widgets/textos_widget.dart';
import 'login_viewcontroller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _viewcontroller = LoginViewController();
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
              InputEmail(
                controller: _viewcontroller.inputControllers['email']!,
              ),
              InputPassword(
                controller: _viewcontroller.inputControllers['password']!,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                child: const BodyText1('Entrar'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  fixedSize: const Size(double.infinity, 45.0),
                ),
                onPressed: () => _viewcontroller.login(context),
              ),
              const SizedBox(height: 15),
              TextButton(
                child: const BodyText1('Cadastre-se'),
                onPressed: () {
                  // TODO: adicionar método para eixibr view de cadastrar
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
