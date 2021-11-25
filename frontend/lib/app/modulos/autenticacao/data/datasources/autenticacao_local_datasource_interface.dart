abstract class IAutenticacaoLocalDatasource {
  Future<String?> getLocalData();
  Future<void> removeLocalData();
}

// sqlite
// shared_preferences
// outro plugin / implementação qualquer