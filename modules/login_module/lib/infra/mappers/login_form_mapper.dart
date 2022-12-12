import '../../domain/entities/login_form_entity.dart';

class LoginFormMapper{

  static Map<String, dynamic> loginFormEntityToJson(LoginFormEntity loginFormEntity) {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['email'] =      loginFormEntity.email;
    json['password'] =  loginFormEntity.senha;
    return json;
  }
}

