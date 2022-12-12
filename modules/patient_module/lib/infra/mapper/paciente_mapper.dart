import 'package:core_module/infra/models/paciente_model.dart';

class PacienteMapper {
  static List<PacienteModel> pacienteModelListFromJson(List<dynamic> jsonList) {
    final List<PacienteModel> list = [];
    for (var element in jsonList) {
      list.add(pacienteModelFromJson(element));
    }
    return list;
  }

  static PacienteModel pacienteModelFromJson(Map<String, dynamic> json) {
    return PacienteModel(
      dataBirth:      json["date_birth"],
      email:          json["user"]["email"],
      fullName:       json["user"]["full_name"],
      password:       "",
      photo:          json["user"]["photo"],
    );
  }
}
