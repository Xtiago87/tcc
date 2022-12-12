import '../../domain/entities/login_form_entity.dart';
import 'package:login_module/domain/entities/paciente_cadastro_form_entity.dart';

class PacienteCadastroFormMapper {
  static Map<String, dynamic> pacienteCadastroFormToJson(PacienteCadastroFormEntity pacienteCadastroFormEntity) {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['user'] = {
      'email': pacienteCadastroFormEntity.email,
      'full_name': pacienteCadastroFormEntity.fullName,
      'password': pacienteCadastroFormEntity.password,
      'photo': pacienteCadastroFormEntity.photo,
    };

    json['pacient'] = {
      'date_birth': pacienteCadastroFormEntity.dataBirth,
    };

    return json;
  }
}
