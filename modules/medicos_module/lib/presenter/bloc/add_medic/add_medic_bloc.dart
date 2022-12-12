import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicos_module/domain/usecase/paciente/add_medic_usecase.dart';
import 'package:medicos_module/presenter/bloc/add_medic/add_medic_event.dart';
import 'package:medicos_module/presenter/bloc/add_medic/add_medic_state.dart';

class AddMedicBloc extends Bloc<AddMedicEvent, AddMedicState>{
  final AddMedicUsecase addMedicUsecase = Modular.get<AddMedicUsecase>();
  AddMedicBloc() : super(AddMedicInitialState())  {
    on<AddMedicEvent>((event, emit) async {
      emit(AddMedicLoadingState());
      final response =await addMedicUsecase.addMedic(event.token, event.id);
      response.fold((l) {
        emit(AddMedicFailureState(l.errorMessage));
      }, (r) {
        emit(AddMedicSuccessState());
      });

    });
  }
}