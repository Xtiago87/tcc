import 'package:core_module/infra/datasources/remote/ibase_datasource_remote.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/auth_body_response_entity.dart';
import '../../infra/service/auth_service_impl.dart';

class BaseDatasourceRemoteImpl extends IBaseDatasourceRemote{

   Future<Dio> get getDio async => await _getDio();

   Future<Dio> _getDio()async {

     final AuthBodyResponseEntity authBodyResponseEntity = await AuthServiceImpl().readHeaders();

     final Dio dio = Dio(
       BaseOptions(
         baseUrl: baseUrl,
           headers:{
             "Token-Type" : authBodyResponseEntity.tokenType,
             "Uid" : authBodyResponseEntity.uid,
             "Expiry" : authBodyResponseEntity.expiry,
             "Client" : authBodyResponseEntity.client,
             "Access-Token" : authBodyResponseEntity.accessToken,
           }
       ),
     );
     return dio;
   }

}