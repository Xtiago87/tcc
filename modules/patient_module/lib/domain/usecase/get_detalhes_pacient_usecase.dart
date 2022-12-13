import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:patient_module/domain/repositories/ipatient_repository.dart';

import '../entity/detalhes_paciente_entity.dart';

class GetDetalhesPacientUsecase{
  final IPacienteRepository iPacienteRepository;

  GetDetalhesPacientUsecase(this.iPacienteRepository);


  Future<Either<Failure, DetalhesPacienteEntity>> getDetalhesPaciente(  int id, int pacientId) async {
    return await iPacienteRepository.getDetalhesPaciente(id, pacientId);
  }


}