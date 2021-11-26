import 'package:shared_preferences/shared_preferences.dart';

import '../autenticacao_local_datasource_interface.dart';

class AutenticacaoSharedPreferencesLocalDatasource
    implements IAutenticacaoLocalDatasource {
  final String chave = '/aterrissar/usuario-dados';

  @override
  Future<String?> getLocalData() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(chave);
  }

  @override
  Future<void> saveLocalData(String usuarioDados) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString(chave, usuarioDados);
  }

  @override
  Future<void> removeLocalData() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.remove(chave);
  }
}
