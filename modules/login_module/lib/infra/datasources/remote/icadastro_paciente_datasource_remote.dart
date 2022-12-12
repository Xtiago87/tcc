import 'package:login_module/domain/entities/paciente_cadastro_form_entity.dart';

abstract class ICadastroPacienteDatasourceRemote{
  Future<dynamic> cadastroPaciente(PacienteCadastroFormEntity pacienteCadastroFormEntity);
}