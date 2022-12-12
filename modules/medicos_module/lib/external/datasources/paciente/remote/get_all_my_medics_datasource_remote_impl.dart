import 'package:core_module/domain/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:medicos_module/infra/datasource/remote/iget_all_my_medics_datasource_remote.dart';
import 'package:medicos_module/infra/model/medic_model.dart';

import '../../../../infra/mapper/medic_mapper.dart';

class GetAllMyMedicsDatasourceRemoteImpl extends IGetAllMyMedicsDatasourceRemote{
  @override
  Future<List<MedicModel>> getAllMyMedics(String id) async {
    try {
      final Dio dio = await getDio;

      final response = await dio.get(
          'api/v1/pacient/medic/${id}'
      );

      return MedicMapper.myMedicListFromJson(response.data);
    } on DioError catch (e) {
      throw Failure(errorMessage: e.message);
    }
  }

}