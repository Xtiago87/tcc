import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:perfil_module/domain/entities/editar_perfil_medico_form_entity.dart';
import 'package:perfil_module/domain/repositories/editar_perfil_repository.dart';

class EditarPerfilMedicoUsecase{
  final IEditarPerfilRepository iEditarPerfilRepository;

  EditarPerfilMedicoUsecase(this.iEditarPerfilRepository);


  Future<Either<Failure, dynamic>> call(EditarPerfilMedicoFormEntity form) async {
    return await iEditarPerfilRepository.editarPerfilMedico(form);
  }

}