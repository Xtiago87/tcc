import 'package:core_module/domain/entities/auth_body_response_entity.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:core_module/infra/service/auth_service_impl.dart';
import 'package:dio/dio.dart';
import 'package:perfil_module/infra/datasources/remote/ieditar_perfil_paciente_datasource_remote.dart';
import 'package:perfil_module/infra/models/editar_perfil_paciente_form_model.dart';

class EditarPerfilPacienteDatasourceRemoteImpl extends IEditarPerfilPacienteDatasourceRemote{

  @override
  Future editarPaciente(EditarPerfilPacienteFormModel editarPerfilPacienteFormModel) async {
    try {
      final Dio dio = await getDio;

      final response = await dio.put(
          'api/v1/pacient/medical_center',
          data: {}
      );

      return true;
    } on DioError catch (e) {
      throw Failure(errorMessage: e.message);
    }
  }

}