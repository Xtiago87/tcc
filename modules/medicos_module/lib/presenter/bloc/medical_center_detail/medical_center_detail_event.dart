abstract class MedicalCenterDetailEvent{}

class GetMedicalCenterDetailEvent extends MedicalCenterDetailEvent{
  final int id;

  GetMedicalCenterDetailEvent(this.id);
}