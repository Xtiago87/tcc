import 'package:medicos_module/infra/model/medic_model.dart';

abstract class IMedicDatasource {
  Future<List<MedicModel>> getAllMyMedics(String id);
  Future<dynamic> addMedic(String token, String id);
}