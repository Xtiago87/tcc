import 'package:core_module/external/remote/base_datasource_remote_impl.dart';
import 'package:perfil_module/infra/models/editar_perfil_paciente_form_model.dart';

abstract class IEditarPerfilPacienteDatasourceRemote extends BaseDatasourceRemoteImpl{
  Future<dynamic> editarPaciente(EditarPerfilPacienteFormModel editarPerfilPacienteFormModel);
}