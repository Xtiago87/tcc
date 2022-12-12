import 'package:core_module/external/remote/base_datasource_remote_impl.dart';
import 'package:perfil_module/infra/models/editar_perfil_medico_form_model.dart';

abstract class IEditarPerfilMedicoDatasourceRemote extends BaseDatasourceRemoteImpl {
  Future<dynamic> editarMedico(EditarPerfilMedicoFormModel editarPerfilMedicoFormModel);
}