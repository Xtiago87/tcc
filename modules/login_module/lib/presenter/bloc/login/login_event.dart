import 'package:login_module/domain/entities/login_form_entity.dart';

abstract class LoginEvent {}

class LoginValidationEvent extends LoginEvent {
  final LoginFormEntity loginFormEntity;

  LoginValidationEvent({
    required this.loginFormEntity,
  });
}
