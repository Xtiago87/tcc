import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_module/domain/entity/detalhes_paciente_entity.dart';
import 'package:patient_module/domain/usecase/get_detalhes_pacient_usecase.dart';
import 'package:patient_module/presenter/bloc/detalhes_paciente/detalhes_paciente_state.dart';

import 'detalhes_paciente_event.dart';

class DetalhesPacienteBloc
    extends Bloc<DetalhesPacienteEvent, DetalhesPacienteState> {
  final GetDetalhesPacientUsecase getDetalhesPacientUsecase =
      Modular.get<GetDetalhesPacientUsecase>();

  DetalhesPacienteBloc() : super(DetalhesPacienteInitialState()) {
    on<GetDetalhesPaciente>((event, emit) async {
      emit(DetalhesPacienteLoadingState());
      final result = await getDetalhesPacientUsecase.getDetalhesPaciente(event.userId, event.pacienteId);
      result.fold((l) {
        emit(DetalhesPacienteFailureState(l.errorMessage));
      }, (r) {
        emit(DetalhesPacienteSuccessState(r));
      });
    });
  }
}
