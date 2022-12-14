import 'package:core_module/domain/entities/user_entity.dart';

class PacienteEntity extends UserEntity{
  final String dataBirth;
  final String diagnostic;
  final int id;

  PacienteEntity( {required this.dataBirth, required this.id, required super.email, required super.fullName, required super.password, required super.photo, required this.diagnostic,});


}