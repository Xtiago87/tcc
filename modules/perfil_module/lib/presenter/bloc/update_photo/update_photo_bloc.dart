import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:perfil_module/domain/usecase/update_photo_usecase.dart';
import 'package:perfil_module/presenter/bloc/update_photo/update_photo_event.dart';
import 'package:perfil_module/presenter/bloc/update_photo/update_photo_state.dart';

class UpdatePhotoBloc extends Bloc<UpdatePhotoEvent, UpdatePhotoState> {
  final UpdatePhotoUsecase usecase = Modular.get<UpdatePhotoUsecase>();

  UpdatePhotoBloc() : super(UpdatePhotoInitialState()) {
    on<UpdatePhotoEvent>((event, emit) async {
      emit(UpdatePhotoLoadingState());
      final result = await usecase.updatePhoto(event.photo);
      result.fold((l) {
        emit(UpdatePhotoFailureState(l.errorMessage));
      }, (r) {
        emit(UpdatePhotoSuccessState());
      });
    });
  }
}
