import 'package:chat_module/domain/entities/chat_message_entity.dart';
import 'package:flutter/cupertino.dart';

class ChatChangeNotifier{

  static ChatChangeNotifier instance = ChatChangeNotifier._();

  ChatChangeNotifier._();

  final ValueNotifier<List<ChatMessageEntity>> chatMessages = ValueNotifier([]);

  final ValueNotifier<List<String>> sintomasSelecionados = ValueNotifier([]);

}