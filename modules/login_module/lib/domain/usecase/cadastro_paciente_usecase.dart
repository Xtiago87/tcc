import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:login_module/domain/entities/paciente_cadastro_form_entity.dart';
import 'package:login_module/domain/repository/icadastro_repository.dart';

class CadastroPacienteUsecase{
  final ICadastroRepository cadastroRepository;

  CadastroPacienteUsecase({required this.cadastroRepository});

  Future<Either<Failure, dynamic>> cadastrarPaciente(PacienteCadastroFormEntity pacienteCadastroFormEntity)async{
    return await cadastroRepository.createPaciente(pacienteCadastroFormEntity);
  }

}