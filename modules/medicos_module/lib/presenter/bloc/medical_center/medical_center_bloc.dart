import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicos_module/domain/usecase/paciente/list_all_medical_centers_usecase.dart';
import 'package:medicos_module/presenter/bloc/medical_center/medical_center_events.dart';
import 'package:medicos_module/presenter/bloc/medical_center/medical_center_states.dart';

class MedicalCenterBloc extends Bloc<MedicalCenterEvent, MedicalCenterState>{
  final ListAllMedicalCentersUsecase usecase = Modular.get<ListAllMedicalCentersUsecase>();

  MedicalCenterBloc() : super(MedicalCenterInitialState()) {
    on<GetAllMedicalCentersEvent>((event, emit) async {
      emit(MedicalCenterLoadingState());
      final result = await usecase.listAllMedicalCentersUsecase();
      result.fold((l) {
        emit(MedicalCenterFailureState(errorMessage: l.errorMessage));
      }, (r) {
        emit(MedicalCenterSuccessState(list: r));
      });
    });

    on<GetAllMedicMedicalCentersEvent>((event, emit) async {
      emit(MedicalCenterLoadingState());
      final result = await usecase.listAllMedicalCentersUsecase();
      result.fold((l) {
        emit(MedicalCenterFailureState(errorMessage: l.errorMessage));
      }, (r) {
        var list = [];
        emit(MedicalCenterSuccessState(list: r));
      });
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}