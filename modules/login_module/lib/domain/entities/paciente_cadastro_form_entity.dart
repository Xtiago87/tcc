
import 'package:login_module/domain/entities/user_cadastro_form_entity.dart';

class PacienteCadastroFormEntity extends UserCadastroEntity{
  final String dataBirth;

  PacienteCadastroFormEntity({required this.dataBirth, required super.email, required super.fullName, required super.password, required super.photo});


}