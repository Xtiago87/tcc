import 'package:chat_module/domain/entities/message_entity.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/message_response_entity.dart';

abstract class IMessageRepository{

  Future<Either<Failure, MessageResponseEntity>> sendTextMessage(String text, int id);

  Future<Either<Failure, MessageResponseEntity>> sendOptionsMessage(String text, int id);

}