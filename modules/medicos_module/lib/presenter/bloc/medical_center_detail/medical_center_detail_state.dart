import 'package:medicos_module/domain/entities/medic_entity.dart';

abstract class MedicalCenterDetailState{}


class MedicalCenterDetailInitialState extends MedicalCenterDetailState{}

class MedicalCenterDetailSuccessState extends MedicalCenterDetailState{
  final List<MedicEntity> list;

  MedicalCenterDetailSuccessState(this.list);
}

class MedicalCenterDetailFailureState extends MedicalCenterDetailState{
  final String errorMessage;

  MedicalCenterDetailFailureState(this.errorMessage);
}

class MedicalCenterDetailLoadingState extends MedicalCenterDetailState{

}