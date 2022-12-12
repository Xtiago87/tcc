import 'package:core_module/core_module.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:patient_module/domain/repositories/ipatient_repository.dart';

class GetAllMyPacientesUsecase{
  final IPacienteRepository iPacienteRepository;

  GetAllMyPacientesUsecase(this.iPacienteRepository);

  Future<Either<Failure, List<PacienteEntity>>> call(int id) async {
    return await iPacienteRepository.getAllMyPatients(id);
  }

}