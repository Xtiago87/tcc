import '../entities/auth_body_response_entity.dart';

abstract class IAuthService {
  Future<dynamic> saveHeaders({required AuthBodyResponseEntity value});
  Future<AuthBodyResponseEntity> readHeaders();
  Future<dynamic> saveUserType(String userType);
  Future<String> readUserType();
}
