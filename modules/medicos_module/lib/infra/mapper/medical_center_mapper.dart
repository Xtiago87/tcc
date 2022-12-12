import 'package:medicos_module/infra/model/medical_center_model.dart';

class MedicalCenterMapper {
  static List<MedicalCenterModel> listFromJson(List<dynamic> json) {
    final List<MedicalCenterModel> list = [];

    for (var element in json) {
      list.add(medicalCenterModelFromJson(element));
    }

    return list;
  }

  static MedicalCenterModel medicalCenterModelFromJson(
      Map<String, dynamic> json) {
    return MedicalCenterModel(
      id: json["id"],
        adress: json["adress"],
        healthPlan: json["health_plan"],
        name: json["name"]);
  }
}
