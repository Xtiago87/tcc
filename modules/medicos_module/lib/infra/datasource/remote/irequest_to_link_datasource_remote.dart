import 'package:core_module/external/remote/base_datasource_remote_impl.dart';

abstract class IRequestToLinkDatasourceRemote extends BaseDatasourceRemoteImpl{
  Future<dynamic> requestToLink(String token, String id);
}