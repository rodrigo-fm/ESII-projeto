import 'package:flutter/material.dart';
import 'package:frontend2/app/shared/presentation/widgets/textos_widget.dart';

import '../../../../../shared/presentation/widgets/inputs_widget.dart';

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
                onPressed: () {
                  // TODO: adicionar método de login aqui
                },
              ),
              const SizedBox(height: 15),
              TextButton(
                child: const BodyText1('Cadastre-se'),
                onPressed: () {
                  // TODO: adicionar método para
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
