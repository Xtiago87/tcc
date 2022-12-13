import 'package:core_module/core_module.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:patient_module/domain/entity/detalhes_paciente_entity.dart';

abstract class IPacienteRepository{
  Future<Either<Failure, List<PacienteEntity>>> getAllMyPatients(int id);
  Future<Either<Failure, DetalhesPacienteEntity>> getDetalhesPaciente(int id, int pacienteId);
}