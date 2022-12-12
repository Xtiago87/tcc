import 'package:core_module/domain/error/failure.dart';
import 'package:core_module/infra/datasources/iperfil_datasource.dart';
import 'package:core_module/infra/datasources/local/iperfil_datasource_local.dart';
import 'package:core_module/infra/models/perfil_model.dart';

class PerfilDatasourceImpl extends IPerfilDatasource{

final IPerfilDatasourceLocal iPerfilDatasourceLocal;

  PerfilDatasourceImpl(this.iPerfilDatasourceLocal);

  @override
  Future<PerfilModel> getPerfil() async {
    try{
      final perfil = await iPerfilDatasourceLocal.getPerfil();
      return perfil;
    } on Failure{
      rethrow;
    } finally{
      await iPerfilDatasourceLocal.closeStore();
    }
  }

  @override
  Future deletePerfil() async {
    try{
      await iPerfilDatasourceLocal.deletePerfil();
      return true;
    } on Failure{
      rethrow;
    } finally{
      await iPerfilDatasourceLocal.closeStore();
    }
  }

  @override
  Future savePerfil(PerfilModel perfilModel) async {
    try{
      await iPerfilDatasourceLocal.deletePerfil();
      await iPerfilDatasourceLocal.savePerfil(perfilModel);
      return true;
    } on Failure{
      rethrow;
    } finally{
      await iPerfilDatasourceLocal.closeStore();
    }
  }

}