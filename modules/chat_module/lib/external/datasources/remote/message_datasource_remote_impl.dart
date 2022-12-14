import 'package:chat_module/infra/datasources/remote/imessage_datasource_remote.dart';
import 'package:chat_module/infra/mapper/message_mapper.dart';
import 'package:chat_module/infra/models/message_model.dart';
import 'package:chat_module/infra/models/message_response_model.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:dio/dio.dart';

class MessageDatasourceRemoteImpl extends IMessageDatasourceRemote{

  @override
  Future<MessageResponseModel> sendOptionsMessage(String text, int id) async {
    try {
      final Dio dio = Dio();

      final response = await dio.post(
        'https://7fe1-177-19-248-246.sa.ngrok.io/webhooks/rest/webhook',
        data: MessageMapper.messageToJson(text, id),
      );

      return MessageMapper.messageResponseModelOptionsFromJson(response.data);
    } on DioError catch (e) {
      throw Failure(errorMessage: e.message);
    }
  }

  @override
  Future<MessageModel> sendTextMessage(String text, int id) async {
    try {
      final Dio dio = Dio();

      final response = await dio.post(
        'https://01d2-187-18-138-176.sa.ngrok.io/webhooks/rest/webhook',
        data: MessageMapper.messageToJson(text, id));


      return MessageMapper.messageResponseModelFromJson(response.data);
    } on DioError catch (e) {
      throw Failure(errorMessage: e.message);
    }
  }

}