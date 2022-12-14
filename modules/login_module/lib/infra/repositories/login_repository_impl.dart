import 'package:core_module/domain/error/failure.dart';
import 'package:login_module/domain/repository/ilogin_repository.dart';
import 'package:login_module/infra/datasources/ilogin_datasource.dart';
import '../../domain/entities/login_form_entity.dart';
import '../datasources/remote/ilogin_datasource_remote.dart';

import 'package:fpdart/fpdart.dart';

import '../models/login_response_body_model.dart';

class LoginRepositoryImpl implements ILoginRepository {
  final ILoginDatasource _dataSource;

  LoginRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, LoginResponseBodyModel>> login(LoginFormEntity loginFormEntity) async {
    try {
      final result = await _dataSource.login(loginFormEntity);
      return Right(result);
    } on Failure catch(e) {
      return Left(e);
    }
  }
}

