import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/src/either.dart';
import 'package:medicos_module/domain/entities/medic_entity.dart';
import 'package:medicos_module/domain/repositories/imedic_repository.dart';
import 'package:medicos_module/infra/datasource/imedic_datasource.dart';

class MedicRepositoryImpl extends IMedicRepository{

  final IMedicDatasource iMedicDatasource;

  MedicRepositoryImpl(this.iMedicDatasource);


  @override
  Future<Either<Failure, List<MedicEntity>>> getAllMyMedics(String id) async {
    try{
      return Right(await iMedicDatasource.getAllMyMedics(id));
    } on Failure catch (e){
      return Left(Failure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, dynamic>> addMedic(String token, String id) async {
    try{
      return Right(await iMedicDatasource.addMedic(token, id));
    } on Failure catch (e){
      return Left(Failure(errorMessage: e.errorMessage));
    }
  }

}