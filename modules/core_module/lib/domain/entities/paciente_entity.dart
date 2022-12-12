import 'package:core_module/domain/entities/user_entity.dart';

class PacienteEntity extends UserEntity{
  final String dataBirth;

  PacienteEntity({required this.dataBirth, required super.email, required super.fullName, required super.password, required super.photo});


}