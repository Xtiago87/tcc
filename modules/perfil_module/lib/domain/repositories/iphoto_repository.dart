import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class IPhotoRepository{
  Future<Either<Failure, dynamic>> updatePhoto(String photo);
}