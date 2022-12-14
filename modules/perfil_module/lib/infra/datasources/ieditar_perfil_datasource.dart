import '../models/editar_perfil_medico_form_model.dart';
import '../models/editar_perfil_paciente_form_model.dart';

abstract class IEditarPerfilDatasource{
  Future<dynamic> editarPerfilMedico(EditarPerfilMedicoFormModel editarPerfilMedicoFormModel);
  Future<dynamic> editarPerfilPaciente(EditarPerfilPacienteFormModel editarPerfilPacienteFormModel);
}