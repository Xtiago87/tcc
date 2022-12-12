import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:perfil_module/domain/repositories/iphoto_repository.dart';

class UpdatePhotoUsecase{

  final IPhotoRepository iPhotoRepository;

  UpdatePhotoUsecase(this.iPhotoRepository);

  Future<Either<Failure, dynamic>> updatePhoto(String photo) async {
    return await iPhotoRepository.updatePhoto(photo);
  }
}