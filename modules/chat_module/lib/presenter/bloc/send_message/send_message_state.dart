import 'package:chat_module/domain/entities/message_response_entity.dart';

abstract class SendMessageState{}

class SendMessageInitialState extends SendMessageState{}

class SendMessageSuccessState extends SendMessageState{
  final MessageResponseEntity messageResponseEntity;

  SendMessageSuccessState(this.messageResponseEntity);
}

class SendMessageFailureState extends SendMessageState{
  final String errorMessage;

  SendMessageFailureState(this.errorMessage);
}

class SendMessageLoadingState extends SendMessageState{}