import 'package:core_module/domain/error/failure.dart';
import 'package:login_module/domain/entities/medico_cadastro_form_entity.dart';
import 'package:login_module/domain/entities/paciente_cadastro_form_entity.dart';
import 'package:login_module/infra/datasources/icadastro_datasource.dart';
import 'package:login_module/infra/datasources/remote/icadastro_medico_datasource_remote.dart';
import 'package:login_module/infra/datasources/remote/icadastro_paciente_datasource_remote.dart';

class CadastroDatasoruceImpl extends ICadastroDatasource {
  
  final ICadastroPacienteDatasourceRemote iCadastroPacienteDatasourceRemote;
  final ICadastroMedicoDatasourceRemote iCadastroMedicoDatasourceRemote;

  CadastroDatasoruceImpl({required this.iCadastroMedicoDatasourceRemote, required this.iCadastroPacienteDatasourceRemote});

  @override
  Future createPaciente(
      PacienteCadastroFormEntity pacienteCadastroFormEntity) async {
    try {
      return await iCadastroPacienteDatasourceRemote
          .cadastroPaciente(pacienteCadastroFormEntity);
    } on Failure {
      rethrow;
    }
  }

  @override
  Future createMedico(MedicoCadastroFormEntity medicoCadastroFormEntity) async {
    try {
      return await iCadastroMedicoDatasourceRemote.cadastroMedico(medicoCadastroFormEntity);
    } on Failure {
      rethrow;
    }
  }
}
