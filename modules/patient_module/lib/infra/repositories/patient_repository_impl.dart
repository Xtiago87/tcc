import 'package:core_module/domain/entities/paciente_entity.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/src/either.dart';
import 'package:patient_module/domain/repositories/ipatient_repository.dart';
import 'package:patient_module/infra/datasources/ipatient_datasource.dart';

class PacienteRepositoryImpl extends IPacienteRepository{

  final IPacienteDatasource iPatientDatasource;

  PacienteRepositoryImpl(this.iPatientDatasource);

  @override
  Future<Either<Failure, List<PacienteEntity>>> getAllMyPatients(int id) async {
    try{
      return Right(await iPatientDatasource.getAllMyPatients(id));
    }on Failure catch (e){
      return Left(Failure(errorMessage: e.errorMessage));
    }
  }

}