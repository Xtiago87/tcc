import 'package:core_module/infra/models/perfil_model.dart';

abstract class IPerfilDatasourceLocal{
  Future<dynamic> getStore();
  Future<dynamic> getBox();
  Future savePerfil(PerfilModel perfilModel);
  Future<PerfilModel> getPerfil();
  Future deletePerfil();
  Future closeStore();
}