import 'package:login_module/domain/entities/login_form_entity.dart';
import 'package:login_module/domain/entities/paciente_cadastro_form_entity.dart';

abstract class CadastroPacienteEvent {}

class CadastroPacienteValidationEvent extends CadastroPacienteEvent {
  final PacienteCadastroFormEntity pacienteCadastroFormEntity;

  CadastroPacienteValidationEvent({
    required this.pacienteCadastroFormEntity,
  });
}
