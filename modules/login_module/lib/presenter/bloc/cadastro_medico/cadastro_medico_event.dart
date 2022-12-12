import 'package:login_module/domain/entities/login_form_entity.dart';
import 'package:login_module/domain/entities/medico_cadastro_form_entity.dart';
import 'package:login_module/domain/entities/paciente_cadastro_form_entity.dart';

abstract class CadastroMedicoEvent {}

class CadastroMedicoValidationEvent extends CadastroMedicoEvent {
  final MedicoCadastroFormEntity medicoCadastroFormEntity;

  CadastroMedicoValidationEvent({
    required this.medicoCadastroFormEntity,
  });
}
