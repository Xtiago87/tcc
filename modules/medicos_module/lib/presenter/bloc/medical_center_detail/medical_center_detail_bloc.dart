import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicos_module/domain/usecase/paciente/get_medical_center_details_usecase.dart';
import 'package:medicos_module/presenter/bloc/medical_center/medical_center_states.dart';
import 'package:medicos_module/presenter/bloc/medical_center_detail/medical_center_detail_state.dart';

import 'medical_center_detail_event.dart';

class MedicalCenterDetailBloc extends Bloc<MedicalCenterDetailEvent, MedicalCenterDetailState> {
  final GetMedicalCenterDetailsUsecase getMedicalCenterDetailsUsecase = Modular.get<GetMedicalCenterDetailsUsecase>();
  MedicalCenterDetailBloc() : super(MedicalCenterDetailInitialState()) {
    on<GetMedicalCenterDetailEvent>((event, emit) async {
      emit(MedicalCenterDetailLoadingState());
      final result = await getMedicalCenterDetailsUsecase.getMedicalCenterDetailsUsecase(event.id);
      result.fold((l) {
        emit(MedicalCenterDetailFailureState(l.errorMessage));
      }, (r) {
        emit(MedicalCenterDetailSuccessState(r));
      });

    });
  }
}
