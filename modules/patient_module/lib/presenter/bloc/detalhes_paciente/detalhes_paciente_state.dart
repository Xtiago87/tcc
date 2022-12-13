import 'package:patient_module/domain/entity/detalhes_paciente_entity.dart';

abstract class DetalhesPacienteState{}

class DetalhesPacienteInitialState extends DetalhesPacienteState{}

class DetalhesPacienteLoadingState extends DetalhesPacienteState{}

class DetalhesPacienteSuccessState extends DetalhesPacienteState{
  final DetalhesPacienteEntity detalhesPacienteEntity;

  DetalhesPacienteSuccessState(this.detalhesPacienteEntity);
}

class DetalhesPacienteFailureState extends DetalhesPacienteState{
  final String errorMessage;

  DetalhesPacienteFailureState(this.errorMessage);
}