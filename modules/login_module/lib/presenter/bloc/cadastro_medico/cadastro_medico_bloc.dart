import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_module/domain/usecase/cadastro_medico_usecase.dart';
import 'package:login_module/domain/usecase/cadastro_paciente_usecase.dart';
import 'package:login_module/domain/usecase/login_usecase.dart';

import 'cadastro_medico_event.dart';
import 'cadastro_medico_state.dart';

class CadastroMedicoBloc extends Bloc<CadastroMedicoEvent, CadastroMedicoState> {
  final CadastroMedicoUsecase usecase = Modular.get<CadastroMedicoUsecase>();

  CadastroMedicoBloc() : super(CadastroMedicoInitialState()) {
    on<CadastroMedicoValidationEvent>((event, emit) async {
      emit(CadastroMedicoLoadingState());
      final result = await usecase.cadastrarMedico(event.medicoCadastroFormEntity);
      result.fold((l) {
        emit(CadastroMedicoFailureState(errorMessage: l.errorMessage));
      }, (r) {
        emit(CadastroMedicoSuccessState());
      });
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
