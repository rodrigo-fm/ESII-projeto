import 'package:flutter/material.dart';
import 'presentation/views/login/login_view.dart';
import 'presentation/routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Routes.login: (ctx) => const LoginView(),
      },
      initialRoute: Routes.login,
    );
  }
}
