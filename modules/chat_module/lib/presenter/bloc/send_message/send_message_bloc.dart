import 'package:chat_module/domain/entities/message_response_entity.dart';
import 'package:chat_module/domain/usecase/send_options_message_usecase.dart';
import 'package:chat_module/domain/usecase/send_text_message_usecase.dart';
import 'package:chat_module/presenter/bloc/send_message/send_message_event.dart';
import 'package:chat_module/presenter/bloc/send_message/send_message_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SendMessageBloc extends Bloc<SendMessageEvent, SendMessageState> {
  final SendOptionsMessageUsecase optionsMessageUsecase =
      Modular.get<SendOptionsMessageUsecase>();
  final SendTextMessageUsecase textMessageUsecase =
      Modular.get<SendTextMessageUsecase>();

  SendMessageBloc() : super(SendMessageInitialState()) {
    on<SendMessageTextEvent>((event, emit) async {
      emit(SendMessageLoadingState());
      final result = await textMessageUsecase.sendTextMessage(event.text, event.id);
      result.fold((l) {
        emit(SendMessageFailureState(l.errorMessage));
      }, (r) {
        emit(SendMessageSuccessState(r));
      });
    });

    on<SendMessageTextOptionsEvent>((event, emit) async {
      emit(SendMessageLoadingState());
      final result = await optionsMessageUsecase.sendOptionsMessage(event.text, event.id);
      result.fold((l) {
        emit(SendMessageFailureState(l.errorMessage));
      }, (r) {
        emit(SendMessageSuccessState(r));
      });
    });
  }
}
