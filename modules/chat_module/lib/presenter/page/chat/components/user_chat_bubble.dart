import 'package:flutter/material.dart';

class UserChatBubble extends StatefulWidget {
  final String message;
  const UserChatBubble({Key? key, required this.message}) : super(key: key);

  @override
  _UserChatBubbleState createState() => _UserChatBubbleState();
}

class _UserChatBubbleState extends State<UserChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.only(left: 8,
                    right: 8,
                    top: 12,
                    bottom: 12),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 87, 159, 251),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )
                ),
                child: Text(widget.message, style: TextStyle(color: Colors.black),),
              ),
            ),
            SizedBox(width: 8,)
          ],
        )
      ],
    );
  }
}
