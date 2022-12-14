import 'package:chat_module/infra/models/message_model.dart';
import 'package:chat_module/infra/models/message_response_model.dart';


abstract class IMessageDatasource{

  Future<MessageResponseModel> sendTextMessage(String text, int id);
  Future<MessageResponseModel> sendOptionsMessage(String text, int id);

}