import 'package:dartz/dartz.dart';

import '../../../../autenticacao/data/modelos/dados_pagamento_model.dart';
import '../../../../autenticacao/data/modelos/dados_pessoais_model.dart';
import '../../dados/datasources/credenciais_remote_datasource_interface.dart';

abstract class ICredenciaisController {
  Future<Either<String, bool>> salvarDadosPessoais(
    ICredenciaisRemoteDatasource datasource,
    DadosPessoaisModel? dadosPessoais,
    int idUsuario,
  );
  Future<Either<String, bool>> salvarDadosPagamento(
    ICredenciaisRemoteDatasource datasource,
    DadosPagamentoModel? dadosPagamento,
    int idUsuario,
  );
}
