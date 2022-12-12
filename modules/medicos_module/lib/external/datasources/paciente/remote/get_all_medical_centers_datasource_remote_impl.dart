import 'package:core_module/domain/entities/auth_body_response_entity.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:core_module/infra/service/auth_service_impl.dart';
import 'package:dio/dio.dart';
import 'package:medicos_module/infra/datasource/remote/iget_all_medical_centers_datasource_remote.dart';
import 'package:medicos_module/infra/model/medical_center_model.dart';

import '../../../../infra/mapper/medical_center_mapper.dart';

class GetAllMedicalCentersDatasourceRemoteImpl
    extends IGetAllMedicalCentersDatasoureRemote {
  @override
  Future<List<MedicalCenterModel>> getAllMedicalCenters() async {
    try {
      final Dio dio = await getDio;

      final response = await dio.get(
          'api/v1/pacient/medical_center'
      );

      return MedicalCenterMapper.listFromJson(response.data);
    } on DioError catch (e) {
      throw Failure(errorMessage: e.message);
    }
  }
}
