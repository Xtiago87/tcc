import 'package:core_module/external/remote/base_datasource_remote_impl.dart';

abstract class IUpdatePhotoDatasourceRemote extends BaseDatasourceRemoteImpl{
  Future<dynamic> updatePhoto(String photo);
}