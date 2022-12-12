import 'package:core_module/core_module.dart';

abstract class MeusPacientesState{}

class MeusPacientesInitialState extends MeusPacientesState{}

class MeusPacientesSuccessState extends MeusPacientesState{
  final List<PacienteEntity> list;

  MeusPacientesSuccessState(this.list);
}

class MeusPacientesFailureState extends MeusPacientesState{
  final String errorMessage;

  MeusPacientesFailureState(this.errorMessage);
}

class MeusPacientesLoadingState extends MeusPacientesState{}