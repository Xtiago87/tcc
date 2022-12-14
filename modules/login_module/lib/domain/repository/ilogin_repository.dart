import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../../infra/models/login_response_body_model.dart';
import '../entities/login_form_entity.dart';


abstract class ILoginRepository{
  Future<Either<Failure, LoginResponseBodyModel>> login(LoginFormEntity loginFormEntity);
}