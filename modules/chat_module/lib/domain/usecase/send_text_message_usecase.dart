import 'package:chat_module/domain/entities/message_entity.dart';
import 'package:chat_module/domain/repositories/imessage_repository.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/message_response_entity.dart';

class SendTextMessageUsecase{
  final IMessageRepository iMessageRepository;

  SendTextMessageUsecase(this.iMessageRepository);

  Future<Either<Failure, MessageEntity>> sendTextMessage(String text) async {
    return await iMessageRepository.sendTextMessage(text);
  }

}