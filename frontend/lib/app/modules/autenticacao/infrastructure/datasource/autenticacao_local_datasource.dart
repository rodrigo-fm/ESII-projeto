import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasources/autenticacao_local_datasource_interface.dart';

class AutenticacaoLocalDatasource implements IAutenticacaoLocalDatasource {
  final userData = 'aterrisar/user-data';

  @override
  Future<String?> getLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userData);
  }

  @override
  Future<void> removeLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(userData);
  }
}
