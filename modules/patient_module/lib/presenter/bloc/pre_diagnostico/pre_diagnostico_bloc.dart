import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_module/presenter/bloc/pre_diagnostico/pre_diagnostico_event.dart';
import 'package:patient_module/presenter/bloc/pre_diagnostico/pre_diagnostico_state.dart';

class PreDiagnosticoBloc extends Bloc<PreDiagnosticoEvent, PreDiagnosticoState>{



  PreDiagnosticoBloc() : super(PreDiagnosticoInitialState()){
    on<GetPreDiagnosticoEvent>((event, emit) async {
      emit(PreDiagnosticoLoadingState());

    });
  }

}