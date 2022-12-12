import 'package:core_module/domain/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:medicos_module/infra/mapper/medic_mapper.dart';
import 'package:medicos_module/infra/model/medic_model.dart';

import '../../../../infra/datasource/remote/iget_medical_center_details_datasource_remote.dart';

class GetMedicalCenterDetailsDatasourceRemoteImpl extends IGetMedicalCenterDetailsDatasourceRemote {


  @override
  Future<List<MedicModel>> getMedicalCenterDetails(int id) async {
    try {
      final Dio dio = await getDio;

      final response = await dio.get(
          '/api/v1/pacient/medical_center/$id',
      );

      return MedicMapper.listFromJson(response.data);
    } on DioError catch (e) {
      throw Failure(errorMessage: e.message);
    }
  }
}
