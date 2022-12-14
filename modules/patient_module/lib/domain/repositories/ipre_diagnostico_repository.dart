import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:patient_module/domain/entity/pre_diagnostico_entity.dart';

abstract class IPreDiagnosticoRepository{
  Future<Either<Failure, PreDiagnosticoEntity>> getPreDiagnostico(int id);
}