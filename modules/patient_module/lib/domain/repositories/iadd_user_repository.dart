import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class IAddUserRepository{
  Future<Either<Failure, String>> getToken(int id);
  Future<Either<Failure, dynamic>> acceptRequest();
}