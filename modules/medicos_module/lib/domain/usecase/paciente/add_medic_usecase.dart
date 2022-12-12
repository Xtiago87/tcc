import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:medicos_module/domain/repositories/imedic_repository.dart';

class AddMedicUsecase{

  final IMedicRepository iMedicRepository;

  AddMedicUsecase(this.iMedicRepository);

  Future<Either<Failure,dynamic>> addMedic(String token, String id) async {
    return await iMedicRepository.addMedic(token, id);
  }
}