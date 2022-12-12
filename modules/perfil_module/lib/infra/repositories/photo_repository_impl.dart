import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/src/either.dart';
import 'package:perfil_module/domain/repositories/iphoto_repository.dart';
import 'package:perfil_module/infra/datasources/iupdate_photo_datasource.dart';

class PhotoRepositoryImpl extends IPhotoRepository{
  final IUpdatePhotoDatasource iUpdatePhotoDatasource;

  PhotoRepositoryImpl(this.iUpdatePhotoDatasource);


  @override
  Future<Either<Failure, dynamic>> updatePhoto(String photo) async {
    try{
      return Right(await iUpdatePhotoDatasource.updatePhoto(photo));
    } on Failure catch (e){
      return Left(Failure(errorMessage: e.errorMessage));
    }
  }

}