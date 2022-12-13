import 'package:chat_module/presenter/bloc/send_message/send_message_bloc.dart';
import 'package:chat_module/presenter/bloc/send_message/send_message_event.dart';
import 'package:flutter/material.dart';


class ChatButtonOptions extends StatefulWidget {

  final SendMessageBloc sendMessageBloc;
  final int id;

  const ChatButtonOptions({Key? key, required this.sendMessageBloc, required this.id}) : super(key: key);

  @override
  State<ChatButtonOptions> createState() => _ChatButtonOptionsState();
}

class _ChatButtonOptionsState extends State<ChatButtonOptions> {
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
                    blurRadius: 4)
              ]),
          height: kToolbarHeight,
          child: Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      widget.sendMessageBloc.add(SendMessageTextEvent("Sim", widget.id));
                    },
                    child: Container(
                      color: const Color.fromARGB(255, 227, 242, 253),
                      child: const Center(
                        child: Text(
                          "Sim",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      widget.sendMessageBloc.add(SendMessageTextEvent("Não", widget.id));
                    },
                    child: Container(
                      color: const Color.fromARGB(255, 227, 242, 253),
                      child: const Center(
                        child: Text(
                            "Não",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
