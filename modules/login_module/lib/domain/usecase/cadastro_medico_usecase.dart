import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:login_module/domain/entities/medico_cadastro_form_entity.dart';
import 'package:login_module/domain/entities/paciente_cadastro_form_entity.dart';
import 'package:login_module/domain/repository/icadastro_repository.dart';

class CadastroMedicoUsecase{
    final ICadastroRepository cadastroRepository;

  CadastroMedicoUsecase({required this.cadastroRepository});

  Future<Either<Failure, dynamic>> cadastrarMedico(MedicoCadastroFormEntity medicoCadastroFormEntity) async {
    return await cadastroRepository.createMedico(medicoCadastroFormEntity);
  }
}