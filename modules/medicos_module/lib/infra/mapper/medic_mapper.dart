import 'package:medicos_module/infra/model/medic_model.dart';

class MedicMapper {
  static List<MedicModel> listFromJson(Map<String, dynamic> json) {
    final List<MedicModel> list = [];
    if (json["medic_has_medical_center"] != null) {
      for (var element in json["medic_has_medical_center"]) {
        list.add(medicModelFromJson(element));
      }
    }

    return list;
  }

  static MedicModel medicModelFromJson(Map<String, dynamic> json) {
    return MedicModel(
      email: json['medic']['user']["email"],
      photo: json['medic']['user']["photo"] ?? "",
      name: json['medic']['user']["full_name"],
      crm: json['medic']["crm"],
      speciality: json['medic']["speciality"],
    );
  }

  static List<MedicModel> myMedicListFromJson(List<dynamic> jsonList) {
    final List<MedicModel> list = [];

    for (var json in jsonList) {
      list.add(MedicModel(
        email: json['user']['email'],
        photo: "",
        name: json['user']['full_name'],
        crm: json["crm"],
        speciality: json["speciality"],
      ));
    }

    return list;
  }
}
