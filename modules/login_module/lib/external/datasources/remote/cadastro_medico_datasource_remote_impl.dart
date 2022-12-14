import 'package:core_module/domain/entities/auth_body_response_entity.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:core_module/infra/service/auth_service_impl.dart';
import 'package:dio/dio.dart';
import 'package:login_module/domain/entities/medico_cadastro_form_entity.dart';
import 'package:login_module/infra/datasources/remote/icadastro_medico_datasource_remote.dart';
import 'package:login_module/infra/mappers/medico_cadastro_form_mapper.dart';

class CadastroMedicoDatasourceRemoteImpl extends ICadastroMedicoDatasourceRemote {
  @override
  Future cadastroMedico(MedicoCadastroFormEntity medicoCadastroFormEntity) async {
    try {
      final response = await Dio().post(
        'https://3026-187-18-138-176.sa.ngrok.io/api/v1/createPacient',
        data: MedicoCadastroFormMapper.medicoCadastroFormToJson(
            medicoCadastroFormEntity),
      );

        if (response.statusCode == 201 || response.statusCode == 200) {
          final AuthBodyResponseEntity authBodyResponseEntity =
              AuthBodyResponseEntity(
            accessToken: response.headers.value("Access-Token"),
            client: response.headers.value("client"),
            expiry: response.headers.value("expiry"),
            tokenType: response.headers.value("Token-Type"),
            uid: response.headers.value("uid"),
          );
          AuthServiceImpl().saveHeaders(value: authBodyResponseEntity);
        }
      

      return true;
    } on DioError catch (e) {
      throw Failure(errorMessage: e.message);
    }
  }
  
}