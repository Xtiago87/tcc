import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:medicos_module/domain/repositories/imedic_repository.dart';

import '../../entities/medic_entity.dart';

class GetMyMedicsUsecase{

  final IMedicRepository iMedicRepository;

  GetMyMedicsUsecase(this.iMedicRepository);

  Future<Either<Failure, List<MedicEntity>>> getAllMyMedics(String id) async {
    return await iMedicRepository.getAllMyMedics(id);
  }

}