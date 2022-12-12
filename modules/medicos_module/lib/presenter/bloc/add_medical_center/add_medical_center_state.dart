abstract class AddMedicalCenterState{}

class AddMedicalCenterInitialState extends AddMedicalCenterState{}

class AddMedicalCenterLoadingState extends AddMedicalCenterState{}

class AddMedicalCenterSuccessState extends AddMedicalCenterState{}

class AddMedicalCenterFailureState extends AddMedicalCenterState{
  final String errorMessage;

  AddMedicalCenterFailureState(this.errorMessage);
}