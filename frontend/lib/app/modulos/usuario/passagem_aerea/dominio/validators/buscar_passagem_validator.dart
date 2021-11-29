class BuscarPassagemValidator {
  String? call(DateTime? dataIda, DateTime? dataVolta, bool idaEVolta) {
    if (dataIda == null) {
      return 'Escolha um valor para a data de ida.';
    } else if (idaEVolta) {
      if (dataVolta == null) {
        return 'Escolha um valor para a data de volta.';
      } else if (dataIda.isAfter(dataVolta)) {
        return 'A data de ida não pode ocorrer após a data de volta.';
      }
    }
  }
}
