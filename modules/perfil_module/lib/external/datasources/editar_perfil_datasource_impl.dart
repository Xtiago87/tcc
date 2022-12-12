import 'package:core_module/domain/error/failure.dart';
import 'package:perfil_module/infra/datasources/ieditar_perfil_datasource.dart';
import 'package:perfil_module/infra/datasources/remote/ieditar_perfil_medico_datasource_remote.dart';
import 'package:perfil_module/infra/datasources/remote/ieditar_perfil_paciente_datasource_remote.dart';
import 'package:perfil_module/infra/models/editar_perfil_medico_form_model.dart';
import 'package:perfil_module/infra/models/editar_perfil_paciente_form_model.dart';

class EditarPerfilDatasourceImpl extends IEditarPerfilDatasource{
  final IEditarPerfilPacienteDatasourceRemote iEditarPerfilPacienteDatasourceRemote;
  final IEditarPerfilMedicoDatasourceRemote iEditarPerfilMedicoDatasourceRemote;

  EditarPerfilDatasourceImpl(this.iEditarPerfilPacienteDatasourceRemote, this.iEditarPerfilMedicoDatasourceRemote);


  @override
  Future editarPerfilMedico(EditarPerfilMedicoFormModel editarPerfilMedicoFormModel) async {
    try{
      return await iEditarPerfilMedicoDatasourceRemote.editarMedico(editarPerfilMedicoFormModel);
    } on Failure{
      rethrow;
    }
  }

  @override
  Future editarPerfilPaciente(EditarPerfilPacienteFormModel editarPerfilPacienteFormModel) async {
    try{
      return await iEditarPerfilPacienteDatasourceRemote.editarPaciente(editarPerfilPacienteFormModel);
    } on Failure{
      rethrow;
    }
  }

}