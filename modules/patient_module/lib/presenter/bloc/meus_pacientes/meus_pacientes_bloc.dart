import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_module/domain/usecase/get_all_my_pacientes_usecase.dart';
import 'package:patient_module/presenter/bloc/meus_pacientes/meus_pacientes_event.dart';
import 'package:patient_module/presenter/bloc/meus_pacientes/meus_pacientes_state.dart';

class MeusPacientesBloc extends Bloc<MeusPacientesEvent, MeusPacientesState>{

  final GetAllMyPacientesUsecase getAllMyPacientesUsecase = Modular.get<GetAllMyPacientesUsecase>();

  MeusPacientesBloc() : super(MeusPacientesInitialState()){
    on<GetAllMyPacientesEvent>((event, emit) async {
      emit(MeusPacientesLoadingState());
      final response = await getAllMyPacientesUsecase.call(event.id);

      response.fold((l) {
        emit(MeusPacientesFailureState(l.errorMessage));
      }, (r){
        emit(MeusPacientesSuccessState(r));
      });
    });


  }
}