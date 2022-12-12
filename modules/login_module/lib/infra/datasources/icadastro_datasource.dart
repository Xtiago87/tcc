import 'package:login_module/domain/entities/medico_cadastro_form_entity.dart';
import 'package:login_module/domain/entities/paciente_cadastro_form_entity.dart';

abstract class ICadastroDatasource{

  Future<dynamic> createPaciente(PacienteCadastroFormEntity pacienteCadastroFormEntity);

  Future<dynamic> createMedico(MedicoCadastroFormEntity medicoCadastroFormEntity);
}