import 'package:chat_module/presenter/bloc/send_message/send_message_bloc.dart';
import 'package:chat_module/presenter/bloc/send_message/send_message_event.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/chat_message_entity.dart';
import '../util/chat_change_notifier.dart';

class ChatTextField extends StatefulWidget {

  final SendMessageBloc sendMessageBloc;
  final int id;

  const ChatTextField({Key? key, required this.sendMessageBloc, required this.id}) : super(key: key);

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {

  final TextEditingController textEditingController = TextEditingController();
  bool sendMessageBtnVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      height: kToolbarHeight,
      width: MediaQuery.of(context).size.width,
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, -2),
                    blurRadius: 4
                )
              ]
          ),
          height: kToolbarHeight,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller:
                      textEditingController,
                      obscureText: false,
                      textInputAction:
                      TextInputAction.done,
                      style: const TextStyle(
                          color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                        const EdgeInsets.only(
                            left: 12),
                        hintText: "Digite aqui...",
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 15, 86, 179)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromARGB(255, 9, 87, 222),width: 2),
                            borderRadius:
                            BorderRadius.circular(
                                15)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromARGB(255, 9, 87, 222),),
                            borderRadius:
                            BorderRadius.circular(
                                15)),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    widget.sendMessageBloc.add(SendMessageTextEvent(textEditingController.text, widget.id));
                    ChatChangeNotifier.instance.chatMessages.value.add(ChatMessageEntity(textEditingController.text, 1));
                    textEditingController.clear();
                  },
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromARGB(255, 9, 87, 222),
                    child: Center(child: Icon(Icons.send, color: Colors.white,)),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
