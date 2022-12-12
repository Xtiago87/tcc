import 'package:core_module/domain/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:medicos_module/infra/datasource/remote/irequest_to_link_datasource_remote.dart';

class RequestToLinkDatasourceRemoteImpl extends IRequestToLinkDatasourceRemote{
  @override
  Future requestToLink(String token, String id) async {
    try {
      final Dio dio = await getDio;

      final response = await dio.post(
          'api/v1/pacient/requestToLinkMedic/$id',
          data: {
            "token" : token
          }
      );

      return true;
    } on DioError catch (e) {
      throw Failure(errorMessage: e.message);
    }
  }

}