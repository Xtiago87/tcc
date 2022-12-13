import 'package:chat_module/infra/models/message_model.dart';
import 'package:chat_module/infra/models/message_response_model.dart';


abstract class IMessageDatasource{

  Future<MessageModel> sendTextMessage(String text);
  Future<MessageResponseModel> sendOptionsMessage(String text);

}