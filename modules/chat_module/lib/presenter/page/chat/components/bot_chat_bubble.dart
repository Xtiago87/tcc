import 'package:flutter/material.dart';

class BotChatBubble extends StatefulWidget {

  final String message;

  const BotChatBubble({Key? key, required this.message}) : super(key: key);

  @override
  _BotChatBubbleState createState() => _BotChatBubbleState();
}

class _BotChatBubbleState extends State<BotChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 8,),
            const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage("assets/images/chatbot_perfil.png"),
              backgroundColor: Color.fromARGB(255, 227, 242, 253),
            ),
            const SizedBox(width: 8,),
            Flexible(
              child: Container(
                padding: const EdgeInsets.only(left: 8,
                    right: 8,
                    top: 12,
                    bottom: 12),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 227, 242, 253),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )
                ),
                child: Text(widget.message, style: const TextStyle(color: Colors.black),textAlign: TextAlign.justify,),
              ),
            ),
            SizedBox(width: 8,)
          ],
        ),
        const SizedBox(height: 8,),
      ],
    );
  }
}
