import 'package:login_module/domain/entities/user_cadastro_form_entity.dart';

class MedicoCadastroFormEntity extends UserCadastroEntity {
  final String speciality;
  final String crm;

  MedicoCadastroFormEntity(
      {required this.crm,
      required this.speciality,
      required super.email,
      required super.fullName,
      required super.password,
      required super.photo});
}
