abstract class CadastroMedicoState {}

class CadastroMedicoInitialState extends CadastroMedicoState {}

class CadastroMedicoLoadingState extends CadastroMedicoState {}
class CadastroMedicoSuccessState extends CadastroMedicoState {}
class CadastroMedicoFailureState extends CadastroMedicoState {
  final String errorMessage;

  CadastroMedicoFailureState({required this.errorMessage});
}
