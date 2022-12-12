import 'package:core_module/domain/entities/user_entity.dart';


class MedicoEntity extends UserEntity {
  final String speciality;
  final String crm;

  MedicoEntity(
      {required this.crm,
      required this.speciality,
      required super.email,
      required super.fullName,
      required super.password,
      required super.photo});
}
