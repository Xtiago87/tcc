import 'package:chat_module/domain/entities/message_entity.dart';
import 'package:chat_module/domain/entities/message_response_entity.dart';
import 'package:chat_module/domain/repositories/imessage_repository.dart';
import 'package:chat_module/infra/datasources/imessage_datasource.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/src/either.dart';

class MessageRepositoryImpl extends IMessageRepository{

  final IMessageDatasource iMessageDatasource;

  MessageRepositoryImpl(this.iMessageDatasource);


  @override
  Future<Either<Failure, MessageResponseEntity>> sendOptionsMessage(String text, int id) async {
    try{
      return Right(await iMessageDatasource.sendOptionsMessage(text, id));
    } on Failure catch (e){
      return Left(Failure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> sendTextMessage(String text, int id) async {
    try{
      return Right(await iMessageDatasource.sendTextMessage(text, id));
    } on Failure catch (e){
      return Left(Failure(errorMessage: e.errorMessage));
    }
  }

}