import 'package:core_module/core_module.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class IPatientRepository{
  Future<Either<Failure, List<PacienteEntity>>> getAllMyPatients();
}