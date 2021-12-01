import 'package:dartz/dartz.dart';

import '../../../../../autenticacao/data/modelos/dados_pagamento_model.dart';
import '../../../../../autenticacao/data/modelos/dados_pessoais_model.dart';
import '../../../dados/datasources/credenciais_remote_datasource_interface.dart';
import '../credenciais_controllers_interface.dart';

class CredenciaisController implements ICredenciaisController {
  @override
  Future<Either<String, bool>> salvarDadosPagamento(
    ICredenciaisRemoteDatasource datasource,
    DadosPagamentoModel? dadosPagamento,
    int idUsuario,
  ) async {
    try {
      if (dadosPagamento != null) {
        final resultado = await datasource.salvarDadosPagamento(
          idUsuario,
          dadosPagamento,
        );

        if (resultado.statusCode == 200) {
          return const Right(true);
        }
        return const Left('Erro ao cadastrar cartão de crédito');
      }
      return const Right(false);
    } catch (e) {
      return const Left('Erro de conexão');
    }
  }

  @override
  Future<Either<String, bool>> salvarDadosPessoais(
    ICredenciaisRemoteDatasource datasource,
    DadosPessoaisModel? dadosPessoais,
    idUsuario,
  ) async {
    try {
      if (dadosPessoais != null) {
        final resultado = await datasource.salvarDadosPessoais(
          idUsuario,
          dadosPessoais,
        );

        if (resultado.statusCode == 201) {
          return const Right(true);
        }
        return const Left('Erro ao cadastrar dados pessoais');
      }
      return const Right(false);
    } catch (e) {
      return const Left('Erro de conexão');
    }
  }
}
