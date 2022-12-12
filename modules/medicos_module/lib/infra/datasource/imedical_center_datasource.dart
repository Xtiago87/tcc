import 'package:medicos_module/infra/model/medical_center_form_model.dart';

import '../../domain/entities/medical_center_form_entity.dart';
import '../model/medic_model.dart';
import '../model/medical_center_model.dart';

abstract class IMedicalCenterDatasource {
  Future<List<MedicModel>> getMedicalCenterDetails(int id);

  Future<List<MedicalCenterModel>> listAllMedicalCenters();

  Future<dynamic> addMedicalCenter(MedicalCenterFormModel form);
}
