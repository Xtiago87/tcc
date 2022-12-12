import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_module/domain/usecase/cadastro_paciente_usecase.dart';
import 'package:login_module/domain/usecase/login_usecase.dart';

import 'cadastro_paciente_event.dart';
import 'cadastro_paciente_state.dart';

class CadastroPacienteBloc extends Bloc<CadastroPacienteEvent, CadastroPacienteState> {
  final CadastroPacienteUsecase usecase = Modular.get<CadastroPacienteUsecase>();

  CadastroPacienteBloc() : super(CadastroPacienteInitialState()) {
    on<CadastroPacienteValidationEvent>((event, emit) async {
      emit(CadastroPacienteLoadingState());
      final result = await usecase.cadastrarPaciente(event.pacienteCadastroFormEntity);
      result.fold((l) {
        emit(CadastroPacienteFailureState(errorMessage: l.errorMessage));
      }, (r) {
        emit(CadastroPacienteSuccessState());
      });
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
