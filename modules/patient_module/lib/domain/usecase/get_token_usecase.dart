import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:patient_module/domain/repositories/iadd_user_repository.dart';

class GetTokenUsecase{
  final IAddUserRepository iAddUserRepository;

  GetTokenUsecase(this.iAddUserRepository);

  Future<Either<Failure, String>> getToken(int id) async {
    return await iAddUserRepository.getToken(id);
  }

}