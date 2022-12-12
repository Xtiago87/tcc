import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/src/either.dart';
import 'package:perfil_module/domain/entities/editar_perfil_medico_form_entity.dart';
import 'package:perfil_module/domain/entities/editar_perfil_paciente_form_entity.dart';
import 'package:perfil_module/domain/repositories/editar_perfil_repository.dart';
import 'package:perfil_module/infra/models/editar_perfil_medico_form_model.dart';
import 'package:perfil_module/infra/models/editar_perfil_paciente_form_model.dart';

import '../datasources/ieditar_perfil_datasource.dart';

class EditarPerfilRepositoryImpl extends IEditarPerfilRepository {
  final IEditarPerfilDatasource editarPerfilDatasource;

  EditarPerfilRepositoryImpl(this.editarPerfilDatasource);

  @override
  Future<Either<Failure, dynamic>> editarPerfilMedico(
      EditarPerfilMedicoFormEntity entity) async {
    try {
      return Right(await editarPerfilDatasource.editarPerfilMedico(EditarPerfilMedicoFormModel()));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, dynamic>> editarPerfilPaciente(
      EditarPerfilPacienteFormEntity entity) async {
    try {
      return Right(await editarPerfilDatasource.editarPerfilPaciente(EditarPerfilPacienteFormModel()));
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
