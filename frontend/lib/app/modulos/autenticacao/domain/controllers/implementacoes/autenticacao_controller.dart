// import '../autenticacao_controller_interface.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../compartilhado/domain/providers/autenticacao_provider.dart';
import '../../../data/datasources/autenticacao_local_datasource_interface.dart';
import '../../../data/datasources/autenticacao_remote_datasource_interface.dart';
import '../../../data/modelos/usuario_model.dart';
import '../autenticacao_controller_interface.dart';

class AutenticacaoController implements IAutenticacaoController {
  @override
  Future<UsuarioModel?> autoLogin(
    BuildContext ctx,
    IAutenticacaoLocalDatasource localDatasource,
  ) async {
    await Future.delayed(const Duration(seconds: 3));
    final provider = Provider.of<AutenticacaoProvider>(ctx, listen: false);
    final usuarioString = await localDatasource.getLocalData();
    if (usuarioString != null) {
      final usuario = UsuarioModel.fromJson(usuarioString);
      if (DateTime.now().isBefore(usuario.token.dataExpiracao)) {
        provider.usuario = usuario;
        return usuario;
      }
    }
    return null;
  }

  @override
  Future<void> criarConta() {
    // TODO: implement criarConta
    throw UnimplementedError();
  }

  @override
  Future<Either<String, UsuarioModel>> login(
    String email,
    String senha,
    IAutenticacaoRemoteDatasource remoteDatasource,
    IAutenticacaoLocalDatasource localDatasource,
    BuildContext ctx,
  ) async {
    final provider = Provider.of<AutenticacaoProvider>(ctx, listen: false);
    try {
      final resultado = await remoteDatasource.login(email, senha);
      await localDatasource.saveLocalData(resultado.toJson());
      provider.usuario = resultado;
      return Right(resultado);
    } catch (e) {
      return const Left('mensagem de erro');
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
