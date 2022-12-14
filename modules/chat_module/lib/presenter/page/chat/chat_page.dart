import 'package:chat_module/presenter/bloc/send_message/send_message_state.dart';
import 'package:chat_module/presenter/page/chat/components/chat_text_field.dart';
import 'package:chat_module/presenter/page/chat/util/chat_change_notifier.dart';
import 'package:chat_module/presenter/page/chat/util/chat_util.dart';
import 'package:chat_module/presenter/page/sintomas/sintomas_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/entities/chat_message_entity.dart';
import '../../bloc/send_message/send_message_bloc.dart';
import '../../bloc/send_message/send_message_event.dart';
import 'components/bot_chat_bubble.dart';
import 'components/user_chat_bubble.dart';

class ChatPage extends StatefulWidget {
  final int id;
  bool firstTime;
  ChatPage({Key? key, required this.id, required this.firstTime}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final SendMessageBloc sendMessageBloc = Modular.get<SendMessageBloc>();
  int hasMany = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SendMessageBloc>(
      create: (context) => sendMessageBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Modular.to.pushNamed("./dashboard");
            },
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
        body: BlocConsumer<SendMessageBloc, SendMessageState>(
          listener: (context, state) {
            if (state is SendMessageSuccessState) {
              hasMany = state.messageResponseEntity.many;
              if(state.messageResponseEntity.mensgesns.isNotEmpty){
                for (var element in state.messageResponseEntity.mensgesns) {
                  ChatChangeNotifier.instance.chatMessages.value.add(ChatMessageEntity(element, 0));
                }
                ChatChangeNotifier.instance.chatMessages.value.add(ChatMessageEntity(state.messageResponseEntity.text, 0));
              }else{
                ChatChangeNotifier.instance.chatMessages.value.add(ChatMessageEntity(state.messageResponseEntity.text, 0));
              }
              if (state.messageResponseEntity.buttons.isNotEmpty) {
                Future.delayed(Duration(seconds: 5)).then((value){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return SintomasPage(
                        sintomas: ChatUtil.stringListToSintomaEntity(state.messageResponseEntity.buttons),
                        sendMessageBloc: sendMessageBloc,
                        id: widget.id,
                        many: state.messageResponseEntity.many,
                      );
                    },
                  ));
                });
              }
            }

            if (state is SendMessageFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }

          },
          builder: (context, state) {
            if(widget.firstTime){
              widget.firstTime = false;
              sendMessageBloc.add(SendMessageTextEvent("Quero mudar minhas doenças", widget.id));
              ChatChangeNotifier.instance.chatMessages.value.add(ChatMessageEntity("Quero mudar minhas doenças", 1));

            }
            return SizedBox(
              height: MediaQuery.of(context).size.height - kToolbarHeight,
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - kToolbarHeight - kToolbarHeight - kToolbarHeight,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        itemCount: ChatChangeNotifier.instance.chatMessages.value.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item = ChatChangeNotifier
                              .instance.chatMessages.value[index];
                          if (item.userType == 0) {
                            return BotChatBubble(message: item.text);
                          } else {
                            return UserChatBubble(message: item.text);
                          }
                        },
                      ),
                    ),
                  ),
                  ChatTextField(sendMessageBloc: sendMessageBloc, id: widget.id)
                  // if (hasMany == 1) ChatButtonOptions(sendMessageBloc: sendMessageBloc, id: widget.id),
                  // if (hasMany != 1)
                ],
              ),
            );
          },
        ),

      ),
    );
  }
}
