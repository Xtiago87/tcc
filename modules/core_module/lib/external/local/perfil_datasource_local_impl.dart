import 'dart:io';

import 'package:core_module/infra/datasources/local/iperfil_datasource_local.dart';
import 'package:core_module/infra/mappers/perfil_mapper.dart';
import 'package:core_module/infra/models/medico_model.dart';
import 'package:core_module/infra/models/objectbox/perfil.dart';
import 'package:core_module/infra/models/perfil_model.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/error/failure.dart';
import '../../objectbox.g.dart';

class PerfilDatasourceLocalImpl extends IPerfilDatasourceLocal{


  Store? _store;
  Box<Perfil>? _box;

  @override
  Future closeStore() async {
    try {
      await getStore();
      _store!.close();
    } on Failure {
      throw Failure(errorMessage: "Erro a fechar a store");
    } finally {
      _box = null;
      _store = null;
    }
  }

  @override
  Future deletePerfil() async {
    try {
      await getBox();
      _box!.removeAll();
    } on Failure {
      throw Failure(errorMessage: 'Erro ao apagar o perfil');
    }
  }

  @override
  Future getBox() async {
    try {
      await getStore();
      return _box ??= await _store!.box<Perfil>();
    } on Failure {
      throw Failure(errorMessage: 'Erro ao retornar a box');
    }
  }

  @override
  Future getStore() async {
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      return _store ??= await openStore(directory: "${dir.path}/perfil_teste");
    } on Failure {
      throw Failure(errorMessage: 'Erro ao retornar a store');
    }
  }

  @override
  Future savePerfil(PerfilModel perfilModel) async {
    try {
      await getBox();
      await _box!.put(PerfilMapper.perfilModelToObjectbox(perfilModel));
    } on Failure {
      throw Failure(errorMessage: 'Erro ao salvar o perfil do paciente');
    }
  }

  @override
  Future<PerfilModel> getPerfil() async {
    try {
      await getBox();
      Perfil perfilObj = _box!.getAll().first;
      PerfilModel perfilModel = PerfilMapper.perfilModelFromObjectbox(perfilObj);
      return perfilModel;
    } on Failure {
      throw Failure(errorMessage: 'Erro ao retornar o perfil do médico');
    }
  }

}