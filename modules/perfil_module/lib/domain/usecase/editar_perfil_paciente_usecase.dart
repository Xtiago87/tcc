import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/editar_perfil_paciente_form_entity.dart';
import '../repositories/editar_perfil_repository.dart';

class EditarPerfilPacienteUsecase{
  final IEditarPerfilRepository iEditarPerfilRepository;

  EditarPerfilPacienteUsecase(this.iEditarPerfilRepository);


  Future<Either<Failure, dynamic>> call(EditarPerfilPacienteFormEntity form) async {
    return await iEditarPerfilRepository.editarPerfilPaciente(form);
  }

}