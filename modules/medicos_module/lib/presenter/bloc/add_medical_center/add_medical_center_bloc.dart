import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicos_module/domain/usecase/medic/add_medical_center_usecase.dart';
import 'package:medicos_module/presenter/bloc/add_medical_center/add_medical_center_state.dart';

import 'add_medical_center_event.dart';

class AddMedicalCenterBloc extends Bloc<AddMedicalCenterEvent, AddMedicalCenterState> {
  final AddMedicalCenterUsecase usecase = Modular.get();

  AddMedicalCenterBloc() : super(AddMedicalCenterInitialState()) {
    on<AddMedicalCenterEvent>((event, emit) async {
      emit(AddMedicalCenterLoadingState());
      final result = await usecase.addMedicalCenter(event.formEntity);
      result.fold((l) {
        emit(AddMedicalCenterFailureState(l.errorMessage));
      }, (r) {
        emit(AddMedicalCenterSuccessState());
      });
    });
  }
}
