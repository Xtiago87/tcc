import 'package:chat_module/domain/repositories/imessage_repository.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/message_entity.dart';
import '../entities/message_response_entity.dart';

class SendOptionsMessageUsecase{
  final IMessageRepository iMessageRepository;

  SendOptionsMessageUsecase(this.iMessageRepository);

  Future<Either<Failure, MessageResponseEntity>> sendOptionsMessage(String text) async {
    return await iMessageRepository.sendOptionsMessage(text);
  }

}