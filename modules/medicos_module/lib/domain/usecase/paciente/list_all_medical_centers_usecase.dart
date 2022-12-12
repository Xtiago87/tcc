import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../../entities/medical_center_entity.dart';
import '../../repositories/imedical_center_repository.dart';

class ListAllMedicalCentersUsecase{
  final IMedicalCenterRepository iMedicalCenterRepository;

  ListAllMedicalCentersUsecase({required this.iMedicalCenterRepository});


  Future<Either<Failure, List<MedicalCenterEntity>>> listAllMedicalCentersUsecase() async {
    return await iMedicalCenterRepository.listAllMedicalCenters();
  }

}