import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../data/datasources/autenticacao_local_datasource_interface.dart';
import '../../data/modelos/usuario_model.dart';
import '../../data/datasources/autenticacao_remote_datasource_interface.dart';

abstract class IAutenticacaoController {
  Future<Either<String, UsuarioModel>> login(
    String email,
    String senha,
    IAutenticacaoRemoteDatasource remoteDatasource,
    IAutenticacaoLocalDatasource localDatasource,
    BuildContext ctx,
  );
  Future<Either<String, bool>> logout(
    IAutenticacaoLocalDatasource localDatasource,
  );
  Future<UsuarioModel?> autoLogin(
    BuildContext ctx,
    IAutenticacaoLocalDatasource localDatasource,
  );
  Future<Either<String, bool>> criarConta(
    String nome,
    String email,
    String senha,
    IAutenticacaoRemoteDatasource datasource,
  );
}
