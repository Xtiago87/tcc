abstract class AddMedicState{}

class AddMedicInitialState extends AddMedicState{}

class AddMedicSuccessState extends AddMedicState{}

class AddMedicFailureState extends AddMedicState{
  final String errorMessage;

  AddMedicFailureState(this.errorMessage);
}
class AddMedicLoadingState extends AddMedicState{}