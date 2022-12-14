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
    if (jsonList.length == 2 || jsonList.length == 1) {
      final MessageResponseModel messageResponseModel = MessageResponseModel(
        text: jsonList.first["text"] + (jsonList.length > 1 ? jsonList.last["text"] ?? "" : ""),
        buttons: jsonList.last["custom"] != null
            ? jsonList.last["custom"]["buttons"].cast<String>()
            : [],
        many: jsonList.last["custom"] != null
            ? jsonList.last["custom"]["many"]
            : -1,
        mensgesns: []
      );

      return messageResponseModel;
    }else{
      final MessageResponseModel messageResponseModel = MessageResponseModel(
        text: jsonList[1]["text"] +
            (jsonList.length > 1 ? jsonList.last["text"] ?? "" : ""),
        buttons: jsonList.last["custom"] != null
            ? jsonList.last["custom"]["buttons"].cast<String>()
            : [],
        many: jsonList.last["custom"] != null
            ? jsonList.last["custom"]["many"]
            : -1,
        mensgesns: helper(jsonList.first["custom"])
      );

      return messageResponseModel;
    }
  }

  static List<String> helper(List<dynamic> list){
    final List<String> arrayList = [];

    for (var element in list) {
      arrayList.add("Nome: ${element["name"]}\nEndereço: ${element["adress"]}\n");
    }



    return arrayList;
  }
}
