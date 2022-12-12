import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicos_module/domain/usecase/paciente/get_my_medics_usecase.dart';

import 'meus_medicos_event.dart';
import 'meus_medicos_state.dart';

class MeusMedicosBloc extends Bloc<MeusMedicosEvent, MeusMedicosState> {
  final GetMyMedicsUsecase usecase = Modular.get<GetMyMedicsUsecase>();

  MeusMedicosBloc() : super(MeusMedicosInitialState()) {
    on<GetMeusMedicosEvent>((event, emit) async {
      emit(MeusMedicosLoadingState());
      final response = await usecase.getAllMyMedics(event.id);
      response.fold((l) {
        emit(MeusMedicosFailureState(l.errorMessage));
      }, (r) {
        emit(MeusMedicosSuccessState(r));
      });
    });
  }
}
