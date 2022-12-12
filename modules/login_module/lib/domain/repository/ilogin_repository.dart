import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/login_form_entity.dart';


abstract class ILoginRepository{
  Future<Either<Failure, dynamic>> login(LoginFormEntity loginFormEntity);
}