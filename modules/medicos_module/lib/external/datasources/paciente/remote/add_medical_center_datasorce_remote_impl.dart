import 'package:core_module/domain/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:medicos_module/infra/datasource/remote/iadd_medical_center_datasource_remote.dart';
import 'package:medicos_module/infra/mapper/medical_center_mapper.dart';
import 'package:medicos_module/infra/model/medical_center_form_model.dart';

class AddMedicalCenterDatasourceRemoteImpl extends IAddMedicalCenterDatasourceRemote{
  @override
  Future addMedicalCenter(MedicalCenterFormModel medicalCenterFormModel) async {
    try {
      final Dio dio = await getDio;

      final response = await dio.post(
          'api/v1/medic/medical_center',
              data: MedicalCenterMapper.medicalCenterFormModelToJson(medicalCenterFormModel),
      );

      return true;
    } on DioError catch (e) {
      throw Failure(errorMessage: e.message);
    }
  }

}