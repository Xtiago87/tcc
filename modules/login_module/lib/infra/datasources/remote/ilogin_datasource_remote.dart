import '../../../domain/entities/login_form_entity.dart';
import '../../models/login_response_body_model.dart';

abstract class ILoginDataSourceRemote {
  Future<LoginResponseBodyModel> login(LoginFormEntity loginFormEntity);
}