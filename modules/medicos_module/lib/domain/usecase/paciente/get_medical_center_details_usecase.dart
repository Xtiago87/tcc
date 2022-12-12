import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:medicos_module/domain/entities/medic_entity.dart';
import 'package:medicos_module/domain/repositories/imedical_center_repository.dart';

import '../../entities/medical_center_entity.dart';

class GetMedicalCenterDetailsUsecase{
  final IMedicalCenterRepository iMedicalCenterRepository;

  GetMedicalCenterDetailsUsecase({required this.iMedicalCenterRepository});

  Future<Either<Failure, List<MedicEntity>>> getMedicalCenterDetailsUsecase(int id) async {
    return await iMedicalCenterRepository.getMedicalCenterDetail(id);
  }

}