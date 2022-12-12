import 'package:core_module/domain/error/failure.dart';
import 'package:patient_module/infra/datasources/iadd_user_datasource.dart';
import 'package:patient_module/infra/datasources/remote/iget_token_datasource_remote.dart';

class AddUserDatasourceImpl extends IAddUserDatasource{

  final IGetTokenDatasourceRemote iGetTokenDatasourceRemote;

  AddUserDatasourceImpl(this.iGetTokenDatasourceRemote);

  @override
  Future<String> getToken(int id) async {
    try{
      return await iGetTokenDatasourceRemote.getToken(id);
    }on Failure{
      rethrow;
    }
  }

}