import 'package:chat_module/infra/models/message_model.dart';
import 'package:chat_module/infra/models/message_response_model.dart';

class MessageMapper {
  static Map<String, dynamic> messageToJson(String text, int id) {
    return {
      "sender": id,
      "message": text,
    };
  }

  static MessageModel messageResponseModelFromJson(List<dynamic> jsonList) {
    MessageModel messageModel = MessageModel(jsonList.first["text"]);

    return messageModel;
  }

  static MessageResponseModel messageResponseModelOptionsFromJson(List<dynamic> jsonList) {

    final MessageResponseModel messageResponseModel = MessageResponseModel(
      text: jsonList.first["text"],
      buttons: jsonList.last["buttons"].cast<String>(),
      many: jsonList.last["many"],
    );

    return messageResponseModel;
  }
}
