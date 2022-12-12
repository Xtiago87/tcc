import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/entities/auth_body_response_entity.dart';
import '../../domain/service/iauth_service.dart';

class AuthServiceImpl extends IAuthService {
  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  @override
  Future<AuthBodyResponseEntity> readHeaders() async {
    final AuthBodyResponseEntity authBodyResponseEntity =
        AuthBodyResponseEntity(
      accessToken: await storage.read(key: 'accessToken'),
      client: await storage.read(key: 'client'),
      expiry: await storage.read(key: 'expiry'),
      tokenType: await storage.read(key: 'tokenType'),
      uid: await storage.read(key: 'uid'),
    );

    return authBodyResponseEntity;
  }

  @override
  Future saveHeaders({required AuthBodyResponseEntity value}) async {
    await storage.write(key: 'accessToken', value: value.accessToken);
    await storage.write(key: 'client', value: value.client);
    await storage.write(key: 'expiry', value: value.expiry);
    await storage.write(key: 'tokenType', value: value.tokenType);
    await storage.write(key: 'uid', value: value.uid);
  }

  @override
  Future<String> readUserType() async {
    return await storage.read(key: "pacient_id") ?? "";
  }

  @override
  Future saveUserType(String userType) async {
    await storage.write(key: 'pacient_id', value: userType);
  }
}
