import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_module/domain/usecase/login_usecase.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase usecase = Modular.get<LoginUsecase>();

  LoginBloc() : super(LoginInitialState()) {
    on<LoginValidationEvent>((event, emit) async {
      emit(LoginLoadingState());
      final result = await usecase.call(event.loginFormEntity);
      result.fold((l) {
        emit(LoginFailureState(errorMessage: l.errorMessage));
      }, (r) {
        emit(LoginSuccessState(r));
      });
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
