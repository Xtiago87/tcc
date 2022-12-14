import 'package:chat_module/domain/entities/chat_message_entity.dart';
import 'package:flutter/cupertino.dart';

class ChatChangeNotifier{

  static ChatChangeNotifier instance = ChatChangeNotifier._();

  ChatChangeNotifier._();

  final ValueNotifier<List<ChatMessageEntity>> chatMessages = ValueNotifier([
    ChatMessageEntity("Bem vindo ao Consult, meu nome é Hermes e posso lhe ajudar nas suas próximas consultas guardando informações, listando centros médicos próximos à você, atualizando seu perfil, entre outras coisas. Estou aqui por você!", 0)
  ]);

  final ValueNotifier<List<String>> sintomasSelecionados = ValueNotifier([]);

}