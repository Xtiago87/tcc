import 'package:core_module/infra/models/paciente_model.dart';
import 'package:patient_module/domain/entity/detalhes_paciente_entity.dart';

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
      id: json["id"],
      dataBirth: json["date_birth"],
      email: json["user"]["email"],
      fullName: json["user"]["full_name"],
      password: "",
      photo: json["user"]["photo"] ?? "",
    );
  }

  static DetalhesPacienteModel detalhesPacienteModelFromJson(
      Map<String, dynamic> json) {
    return DetalhesPacienteModel(
      json["date_birth"],
      json["id"],
      json["user"]["email"],
      json["user"]["full_name"],
      illnessEntityListFromJson(json["pacient_has_illness"]),
      alergyEntityListFromJson(json["pacient_has_allergy"]),
      familyIllnessEntityListFromJson(json["pacients_family_has_illness"]),
    );
  }

  static List<IllnessEntity> illnessEntityListFromJson(List<dynamic> json) {
    List<IllnessEntity> list = [];

    json.forEach((element) {
      list.add(IllnessEntity(
        element["illness"]["created_at"],
        element["illness"]["name"],
        element["illness"]["symptoms"],
      ));
    });
    return list;
  }

  static List<AlergyEntity> alergyEntityListFromJson(List<dynamic> json) {
    List<AlergyEntity> list = [];

    json.forEach((element) {
      list.add(AlergyEntity(
        element["allergy"]["created_at"],
        element["allergy"]["name"],
      ));
    });
    return list;
  }

  static List<IllnessEntity> familyIllnessEntityListFromJson(List<dynamic> json) {
    List<IllnessEntity> list = [];

    json.forEach((element) {
      list.add(IllnessEntity(
        element["illness"]["created_at"],
        element["illness"]["name"],
        element["illness"]["symptoms"],
      ));
    });
    return list;
  }
}

class DetalhesPacienteModel extends DetalhesPacienteEntity {
  DetalhesPacienteModel(super.dataBirth, super.id, super.email, super.fullName,
      super.illnessList, super.alergyList, super.familyIllnesslist);
}
