import 'package:core_module/core_module.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class IPacienteRepository{
  Future<Either<Failure, List<PacienteEntity>>> getAllMyPatients(int id);
}