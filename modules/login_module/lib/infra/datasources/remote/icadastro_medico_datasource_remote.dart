import 'package:login_module/domain/entities/medico_cadastro_form_entity.dart';

abstract class ICadastroMedicoDatasourceRemote {
  Future<dynamic> cadastroMedico(MedicoCadastroFormEntity medicoCadastroFormEntity);
}
