import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/src/either.dart';
import 'package:patient_module/domain/repositories/iadd_user_repository.dart';
import 'package:patient_module/infra/datasources/iadd_user_datasource.dart';

class AddUserRepositoryImpl extends IAddUserRepository{

  final IAddUserDatasource iAddUserDatasource;

  AddUserRepositoryImpl(this.iAddUserDatasource);

  @override
  Future<Either<Failure, dynamic>> acceptRequest() {
    // TODO: implement acceptRequest
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> getToken(int id) async {
    try{
      return Right(await iAddUserDatasource.getToken(id));
    } on Failure catch (e) {
      return Left(Failure(errorMessage: e.errorMessage));
    }
  }

}