import 'package:core_module/domain/entities/auth_body_response_entity.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:core_module/infra/models/paciente_model.dart';
import 'package:core_module/infra/service/auth_service_impl.dart';
import 'package:dio/dio.dart';
import 'package:patient_module/infra/datasources/remote/ipatient_datasource_remote_impl.dart';
import 'package:patient_module/infra/mapper/paciente_mapper.dart';

class PatientDatasourceRemoteImpl extends IPatientDatasourceRemoteImpl{

  @override
  Future<List<PacienteModel>> getAllMyPatients(int id) async {
    try {

      final Dio dio = await getDio;

      final response = await dio.get(
        'api/v1/medic/listPacients/$id',
      );

      return PacienteMapper.pacienteModelListFromJson(response.data);
    } on DioError catch (e) {
      throw Failure(errorMessage: e.message);
    }
  }

  @override
  Future<PacienteModel> getPatientDetails() async {
    try {

      final Dio dio = await getDio;

      final response = await dio.get(
        'api/v1/pacient/medical_center/',
      );

      return <PacienteModel>[].first;
    } on DioError catch (e) {
      throw Failure(errorMessage: e.message);
    }

  }

}