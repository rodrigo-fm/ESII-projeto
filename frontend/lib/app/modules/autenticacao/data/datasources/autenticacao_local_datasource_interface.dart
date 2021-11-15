abstract class IAutenticacaoLocalDatasource {
  Future<String?> getLocalData();
  Future<void> removeLocalData();
}
