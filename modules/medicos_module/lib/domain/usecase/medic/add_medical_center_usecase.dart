import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:medicos_module/domain/repositories/imedical_center_repository.dart';

import '../../entities/medical_center_form_entity.dart';

class AddMedicalCenterUsecase{
  final IMedicalCenterRepository iMedicalCenterRepository;

  AddMedicalCenterUsecase(this.iMedicalCenterRepository);


  Future<Either<Failure, dynamic>> addMedicalCenter(MedicalCenterFormEntity form) async {
    return await iMedicalCenterRepository.addMedicalCenter(form);
  }


}