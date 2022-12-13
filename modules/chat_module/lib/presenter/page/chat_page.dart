import 'package:chat_module/presenter/page/components/bot_chat_bubble.dart';
import 'package:chat_module/presenter/page/components/user_chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Hermes",
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        actions: const [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage("assets/images/chatbot_perfil.png"),
            backgroundColor: Color.fromARGB(255, 227, 242, 253),
          )
        ],
      ),
      body: ListView(
        children: const [
          BotChatBubble(message: "Mensagem do bot"),
          UserChatBubble(message: "Minha mensagem",)

        ],
      ),
    );
  }
}
