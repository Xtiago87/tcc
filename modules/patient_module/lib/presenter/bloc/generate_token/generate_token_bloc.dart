import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_module/domain/usecase/get_token_usecase.dart';
import 'package:patient_module/presenter/bloc/generate_token/generate_token_event.dart';
import 'package:patient_module/presenter/bloc/generate_token/generate_token_state.dart';

class GenerateTokenBloc extends Bloc<GenerateTokenEvent, GenerateTokenState> {
  final GetTokenUsecase getTokenUsecase = Modular.get<GetTokenUsecase>();

  GenerateTokenBloc() : super(GenerateTokenInitialState()) {
    on<GetToken>((event, emit) async {
      emit(GenerateTokenLoadingState());
      final result = await getTokenUsecase.getToken(event.id);
      result.fold((l) {
        emit(GenerateTokenFailureState(l.errorMessage));
      }, (r) {
        emit(GenerateTokenSuccessState(r));
      });
    });
  }
}
