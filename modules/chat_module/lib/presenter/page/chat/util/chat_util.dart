import 'package:chat_module/domain/entities/sintoma_entity.dart';

class ChatUtil{
  static List<SintomaEntity> stringListToSintomaEntity(List<String> list){
    List<SintomaEntity> sintomas = [];
    for (var element in list) {
      sintomas.add(SintomaEntity(element, false));
    }
    return sintomas;
  }
}