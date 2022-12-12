import '../../domain/entities/login_form_entity.dart';

abstract class ILoginDatasource{
  Future<dynamic> login(LoginFormEntity loginFormEntity);
}