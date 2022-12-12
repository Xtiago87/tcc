abstract class MedicalCenterEvent{}

class GetAllMedicalCentersEvent extends MedicalCenterEvent{}

class GetAllMedicMedicalCentersEvent extends MedicalCenterEvent{
  final int id;

  GetAllMedicMedicalCentersEvent(this.id);
}
