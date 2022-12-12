import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:medicos_module/domain/entities/medical_center_entity.dart';

import '../entities/medic_entity.dart';

abstract class IMedicalCenterRepository{

  Future<Either<Failure, List<MedicalCenterEntity>>> listAllMedicalCenters();

  Future<Either<Failure, List<MedicEntity>>> getMedicalCenterDetail(int id);

  Future<Either<Failure, dynamic>> addMedicalCenter(dynamic form);
}