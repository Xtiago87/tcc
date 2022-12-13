import 'package:chat_module/infra/datasources/remote/imessage_datasource_remote.dart';
import 'package:chat_module/infra/mapper/message_mapper.dart';
import 'package:chat_module/infra/models/message_model.dart';
import 'package:chat_module/infra/models/message_response_model.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:dio/dio.dart';

class MessageDatasourceRemoteImpl extends IMessageDatasourceRemote{

  @override
  Future<MessageResponseModel> sendOptionsMessage(String text) async {
    try {
      final Dio dio = await getDio;

      final response = await dio.post(
        'api/v1/medic/medical_center',
        data: MessageMapper.messageToJson(text),
      );

      return MessageMapper.messageResponseModelOptionsFromJson(response.data);
    } on DioError catch (e) {
      throw Failure(errorMessage: e.message);
    }
  }

  @override
  Future<MessageModel> sendTextMessage(String text) async {
    try {
      final Dio dio = await getDio;

      final response = await dio.post(
        'api/v1/medic/medical_center',
        data: MessageMapper.messageToJson(text),
      );

      return MessageMapper.messageResponseModelFromJson(response.data);
    } on DioError catch (e) {
      throw Failure(errorMessage: e.message);
    }
  }

}