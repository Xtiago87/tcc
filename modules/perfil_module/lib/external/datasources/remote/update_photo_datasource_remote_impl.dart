import 'package:core_module/domain/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:perfil_module/infra/datasources/remote/iupdate_photo_datasource_remote.dart';

class UpdatePhotoDatasourceRemoteImpl extends IUpdatePhotoDatasourceRemote{
  @override
  Future updatePhoto(String photo) async {
    try {
      final Dio dio = await getDio;

      final response = await dio.put(
          'api/v1/pacient/medical_center',
          data: {
            "photo" : photo,
          }
      );

      return true;
    } on DioError catch (e) {
      throw Failure(errorMessage: e.message);
    }
  }

}