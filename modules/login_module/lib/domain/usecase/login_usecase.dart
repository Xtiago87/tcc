import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:login_module/domain/repository/ilogin_repository.dart';

import '../entities/login_form_entity.dart';


class LoginUsecase{
  final ILoginRepository repository;
  LoginUsecase({required this.repository});

  Future<Either<Failure, dynamic>> call(LoginFormEntity loginFormEntity) async {
    return await repository.login(loginFormEntity);
  }
}