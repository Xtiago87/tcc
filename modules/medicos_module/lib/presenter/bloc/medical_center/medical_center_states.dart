import 'package:medicos_module/domain/entities/medical_center_entity.dart';

abstract class MedicalCenterState{}

class MedicalCenterInitialState extends MedicalCenterState{}

class MedicalCenterLoadingState extends MedicalCenterState{}

class MedicalCenterSuccessState extends MedicalCenterState{
  final List<MedicalCenterEntity> list;

  MedicalCenterSuccessState({required this.list});
}

class MedicalCenterFailureState extends MedicalCenterState{
  final String errorMessage;

  MedicalCenterFailureState({required this.errorMessage});
}
