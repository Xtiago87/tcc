import 'package:core_module/core_module.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:patient_module/domain/repositories/ipatient_repository.dart';

class GetAllMyPatients{
  final IPatientRepository iPatientRepository;

  GetAllMyPatients(this.iPatientRepository);

  Future<Either<Failure, List<PacienteEntity>>> call() async {
    return await iPatientRepository.getAllMyPatients();
  }

}