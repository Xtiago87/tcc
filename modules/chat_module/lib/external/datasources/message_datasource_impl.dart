import 'package:chat_module/infra/datasources/imessage_datasource.dart';
import 'package:chat_module/infra/datasources/remote/imessage_datasource_remote.dart';
import 'package:chat_module/infra/models/message_model.dart';
import 'package:chat_module/infra/models/message_response_model.dart';
import 'package:core_module/domain/error/failure.dart';

class MessageDatasourceImpl extends IMessageDatasource{

  final IMessageDatasourceRemote iMessageDatasourceRemote;

  MessageDatasourceImpl(this.iMessageDatasourceRemote);

  @override
  Future<MessageResponseModel> sendOptionsMessage(String text, int id) async {
    try{
      return await iMessageDatasourceRemote.sendOptionsMessage(text, id);
    } on Failure {
      rethrow;
    }
  }

  @override
  Future<MessageModel> sendTextMessage(String text, int id) async {
    try{
      return await iMessageDatasourceRemote.sendTextMessage(text, id);
    } on Failure {
      rethrow;
    }
  }

}