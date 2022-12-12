import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:login_module/domain/entities/medico_cadastro_form_entity.dart';
import 'package:login_module/domain/entities/paciente_cadastro_form_entity.dart';

abstract class ICadastroRepository {
  Future<Either<Failure, dynamic>> createPaciente(
      PacienteCadastroFormEntity pacienteCadastroFormEntity);
  Future<Either<Failure, dynamic>> createMedico(MedicoCadastroFormEntity medicoCadastroFormEntity);
}
