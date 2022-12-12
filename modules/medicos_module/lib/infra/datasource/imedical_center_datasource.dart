import '../model/medic_model.dart';
import '../model/medical_center_model.dart';

abstract class IMedicalCenterDatasource {
  Future<List<MedicModel>> getMedicalCenterDetails(int id);

  Future<List<MedicalCenterModel>> listAllMedicalCenters();
}
