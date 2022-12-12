import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:perfil_module/domain/entities/editar_perfil_medico_form_entity.dart';
import 'package:perfil_module/domain/entities/editar_perfil_paciente_form_entity.dart';

abstract class IEditarPerfilRepository{
  Future<Either<Failure, dynamic>> editarPerfilMedico(EditarPerfilMedicoFormEntity entity);
  Future<Either<Failure, dynamic>> editarPerfilPaciente(EditarPerfilPacienteFormEntity entity);
}