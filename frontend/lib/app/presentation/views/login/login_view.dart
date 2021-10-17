import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tela de login'),
      ),
      body: ListView(
        children: const [
          Text('aqui vai a tela de login'),
        ],
      ),
    );
  }
}