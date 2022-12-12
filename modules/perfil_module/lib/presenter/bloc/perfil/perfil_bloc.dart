import 'package:core_module/core_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:perfil_module/presenter/bloc/perfil/perfil_event.dart';
import 'package:perfil_module/presenter/bloc/perfil/perfil_state.dart';

class PerfilBloc extends Bloc<PerfilEvent, PerfilState>{
  final GetPerfilUsecase usecase = Modular.get<GetPerfilUsecase>();
  PerfilBloc() : super(PerfilInitialState()){
    on<GetPerfil>((event, emit) async {
      emit(PerfilLoadingState());
      final response = await usecase.getPerfil();
      response.fold((l) {
        emit(PerfilMedicoFailureState(l.errorMessage));
      }, (r) {
        emit(PerfilSuccessState(r));
      });
    });
  }
}