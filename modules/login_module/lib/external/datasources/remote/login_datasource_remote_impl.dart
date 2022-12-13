import 'package:core_module/core_module.dart';
import 'package:core_module/domain/entities/auth_body_response_entity.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:login_module/infra/datasources/remote/ilogin_datasource_remote.dart';
import 'package:login_module/infra/mappers/login_form_mapper.dart';
import '../../../domain/entities/login_form_entity.dart';
import '../../../infra/models/login_response_body_model.dart';

class LoginDataSourceRemoteImpl extends ILoginDataSourceRemote {
  LoginDataSourceRemoteImpl() : super();

  @override
  Future<LoginResponseBodyModel> login(LoginFormEntity loginFormEntity) async {
    try {
      final response = await Dio().post(
        'https://ea82-200-253-187-124.sa.ngrok.io/api/v1/auth/sign_in',
        data: LoginFormMapper.loginFormEntityToJson(loginFormEntity),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final AuthBodyResponseEntity authBodyResponseEntity =
            AuthBodyResponseEntity(
          accessToken: response.headers.value("Access-Token"),
          client: response.headers.value("client"),
          expiry: response.headers.value("expiry"),
          tokenType: response.headers.value("Token-Type"),
          uid: response.headers.value("uid"),
        );
        AuthServiceImpl().saveHeaders(value: authBodyResponseEntity);
        AuthServiceImpl().saveUserType(response.data["pacient_id"] != null ? "1" : "0");
        return LoginResponseBodyModel(
          email: response.data["user"]["email"],
          fullName: response.data["user"]["full_name"],
          id: response.data["user"]["id"] ,
          photo: response.data["user"]["photo"],
          provider: response.data["user"]["provider"],
          uid: response.data["medic_id"] != null ? response.data["medic_id"].toString() : response.data["pacient_id"].toString(),
          userType: response.data["pacient_id"] != null ? "1" : "0"
        );
      }

      throw Failure(errorMessage: response.statusCode.toString());
    } on DioError catch (e) {
      throw Failure(errorMessage: e.message);
    }
  }
}
