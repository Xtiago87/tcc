import 'package:core_module/domain/error/failure.dart';
import 'package:perfil_module/infra/datasources/iupdate_photo_datasource.dart';
import 'package:perfil_module/infra/datasources/remote/iupdate_photo_datasource_remote.dart';

class UpdatePhotoDatasourceImpl extends IUpdatePhotoDatasource{

  final IUpdatePhotoDatasourceRemote iUpdatePhotoDatasourceRemote;

  UpdatePhotoDatasourceImpl(this.iUpdatePhotoDatasourceRemote);

  @override
  Future updatePhoto(String photo) async {
    try{
      return await iUpdatePhotoDatasourceRemote.updatePhoto(photo);
    } on Failure{
      rethrow;
    }
  }

}