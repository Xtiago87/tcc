import 'package:login_module/domain/entities/medico_cadastro_form_entity.dart';

class MedicoCadastroFormMapper{
    static Map<String, dynamic> medicoCadastroFormToJson(MedicoCadastroFormEntity medicoCadastroFormEntity) {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['user'] = {
      'email': medicoCadastroFormEntity.email,
      'full_name': medicoCadastroFormEntity.fullName,
      'password': medicoCadastroFormEntity.password,
      'photo': medicoCadastroFormEntity.photo,
    };

    json['medic'] = {
      'speciality': medicoCadastroFormEntity.speciality,
      'crm' : medicoCadastroFormEntity.crm,
    };

    return json;
  }
}