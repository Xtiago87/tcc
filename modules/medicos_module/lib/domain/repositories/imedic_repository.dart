import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:medicos_module/domain/entities/medic_entity.dart';

abstract class IMedicRepository{
  Future<Either<Failure, List<MedicEntity>>> getAllMyMedics(String id);
  Future<Either<Failure,dynamic>> addMedic(String token, String id);
}