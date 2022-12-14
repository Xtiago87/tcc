import 'package:patient_module/domain/entity/pre_diagnostico_entity.dart';
import 'package:patient_module/presenter/bloc/pre_diagnostico/pre_diagnostico_event.dart';

abstract class PreDiagnosticoState{}

class PreDiagnosticoInitialState extends PreDiagnosticoState{}

class PreDiagnosticoSuccessState extends PreDiagnosticoState{
  final PreDiagnosticoEntity preDiagnosticoEntity;

  PreDiagnosticoSuccessState(this.preDiagnosticoEntity);
}

class PreDiagnosticoFailureState extends PreDiagnosticoState{
  final String errorMessage;

  PreDiagnosticoFailureState(this.errorMessage);
}

class PreDiagnosticoLoadingState extends PreDiagnosticoState{}