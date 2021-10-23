import 'package:flutter/material.dart';

import 'modules/autenticacao/presentation/views/login/login_view.dart';
import 'modules/usuario/presentation/views/home_view.dart';
import 'shared/presentation/routes/global_routes.dart';
import 'shared/presentation/routes/usuario_routes.dart';
import 'shared/presentation/views/splash_screen/splash_screen_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xff0A0A0A),
          ),
          headline2: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w700,
            color: Color(0xff505050),
          ),
          headline3: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff747474),
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xff747474),
          ),
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: const Color(0xff9b009e),
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xffd1d1d1),
          ),
          headline2: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w700,
            color: Color(0xffd1d1d1),
          ),
          headline3: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xffd1d1d1),
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xffd1d1d1),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      routes: {
        GlobalRoutes.login: (ctx) => const LoginView(),
        GlobalRoutes.loading: (ctx) => const SplashScreenView(),
        UsuarioRoutes.home: (ctx) => const HomeView(),
      },
      initialRoute: GlobalRoutes.login,
    );
  }
}
