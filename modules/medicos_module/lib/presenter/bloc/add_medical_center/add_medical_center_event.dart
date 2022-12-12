import 'package:medicos_module/domain/entities/medical_center_form_entity.dart';

class AddMedicalCenterEvent{
  final MedicalCenterFormEntity formEntity;

  AddMedicalCenterEvent(this.formEntity);
}