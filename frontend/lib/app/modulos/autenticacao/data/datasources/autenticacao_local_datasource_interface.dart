abstract class IAutenticacaoLocalDatasource {
  Future<String?> getLocalData();
  Future<void> saveLocalData(String usuarioDados);
  Future<void> removeLocalData();
}
