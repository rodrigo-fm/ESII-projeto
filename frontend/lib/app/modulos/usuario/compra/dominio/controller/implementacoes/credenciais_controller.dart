import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../compartilhado/domain/providers/autenticacao_provider.dart';
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

  @override
  Future<Either<String, DadosPessoaisModel>> resgatarDadosPessoais(
    ICredenciaisRemoteDatasource datasource,
    int idUsuario,
  ) async {
    try {
      final resultado = await datasource.getDadosPessoais(
        idUsuario,
      );

      if (resultado.statusCode == 200) {
        return Right(DadosPessoaisModel.fromJson(resultado.body));
      }
      return const Left('Erro ao resgatar dados pessoais');
    } catch (e) {
      return const Left('Erro de conexão');
    }
  }

  @override
  Future<Either<String, List<DadosPagamentoModel>>> resgatarDadosPagamento(
    ICredenciaisRemoteDatasource datasource,
    int idUsuario,
  ) async {
    try {
      final resultado = await datasource.getDadosPagamento(idUsuario);
      if (resultado.statusCode == 200) {
        final cartoes = DadosPagamentoModel.fromJsonList(resultado.body);
        if (cartoes.isEmpty) {
          return const Left('Nenhum cartão de crédito encontrado');
        }
        return Right(cartoes);
      }
      return const Left('Erro ao resgatar cartões de crédito');
    } catch (e) {
      return const Left('Erro ao contatar servidor');
    }
  }

  @override
  Future<Either<String, bool>> removerDadosPagamento(
    ICredenciaisRemoteDatasource datasource,
    int idCartao,
  ) async {
    try {
      final resultado = await datasource.removerDadosPagamento(idCartao);

      if (resultado.statusCode == 204) {
        return const Right(true);
      }
      return const Left('Erro ao remover dados do cartão');
    } catch (e) {
      return const Left('Erro de conexão');
    }
  }
}
