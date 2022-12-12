import 'package:core_module/domain/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:patient_module/infra/datasources/remote/iget_token_datasource_remote.dart';

class GetTokenDatasourceRemoteImpl extends IGetTokenDatasourceRemote{

  @override
  Future<String> getToken(int id) async {
    try {

      final Dio dio = await getDio;

      final response = await dio.get(
        'api/v1/medic/medic/$id',
      );

      return response.data["token"];
    } on DioError catch (e) {
      throw Failure(errorMessage: e.message);
    }
  }

}