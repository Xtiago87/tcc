import 'package:core_module/domain/entities/medico_entity.dart';
import 'package:core_module/domain/entities/paciente_entity.dart';
import 'package:core_module/domain/entities/perfil_entity.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class IPerfilRepository{
  Future<Either<Failure, PerfilEntity>> getPerfil();
}