abstract class CadastroPacienteState {}

class CadastroPacienteInitialState extends CadastroPacienteState {}

class CadastroPacienteLoadingState extends CadastroPacienteState {}

class CadastroPacienteSuccessState extends CadastroPacienteState {}

class CadastroPacienteFailureState extends CadastroPacienteState {
  final String errorMessage;

  CadastroPacienteFailureState({required this.errorMessage});
}
