import 'package:core_module/domain/entities/paciente_entity.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/src/either.dart';
import 'package:patient_module/domain/repositories/ipatient_repository.dart';
import 'package:patient_module/infra/datasources/ipatient_datasource.dart';

class PatientRepositoryImpl extends IPatientRepository{

  final IPatientDatasource iPatientDatasource;

  PatientRepositoryImpl(this.iPatientDatasource);

  @override
  Future<Either<Failure, List<PacienteEntity>>> getAllMyPatients() async {
    try{
      return Right(await iPatientDatasource.getAllMyPatients());
    }on Failure catch (e){
      return Left(Failure(errorMessage: e.errorMessage));
    }
  }

}