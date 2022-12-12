import 'package:core_module/infra/models/paciente_model.dart';
import 'package:core_module/infra/models/perfil_model.dart';

import '../models/medico_model.dart';

abstract class IPerfilDatasource{
  Future<PerfilModel> getPerfil();
  Future<dynamic> savePerfil(PerfilModel perfilModel);
  Future<dynamic> deletePerfil();
}