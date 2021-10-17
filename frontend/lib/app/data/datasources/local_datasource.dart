import 'package:shared_preferences/shared_preferences.dart';

// datasource local, pensei em usar o shared_preferences aqui
class LocalDataSource {
  final String userInfo = 'aterrissar_user_info';

  // função de auto login só para exemplificar
  Future<void> autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final dadosUsuario = prefs.getString(userInfo);

    if(dadosUsuario != null) {
      // realizar auto login
    } else {
      // retornar erro
    }
  }

}