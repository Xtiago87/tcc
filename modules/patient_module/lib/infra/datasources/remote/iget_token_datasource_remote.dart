import 'package:core_module/external/remote/base_datasource_remote_impl.dart';

abstract class IGetTokenDatasourceRemote extends BaseDatasourceRemoteImpl{
  Future<String> getToken(int id);
}