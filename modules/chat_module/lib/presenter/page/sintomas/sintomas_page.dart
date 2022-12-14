import 'package:chat_module/domain/entities/sintoma_entity.dart';
import 'package:chat_module/presenter/bloc/send_message/send_message_event.dart';
import 'package:chat_module/presenter/page/chat/util/chat_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/entities/chat_message_entity.dart';
import '../../bloc/send_message/send_message_bloc.dart';

class SintomasPage extends StatefulWidget {
  final List<SintomaEntity> sintomas;
  final SendMessageBloc sendMessageBloc;
  final int id;
  final int many;

  const SintomasPage(
      {Key? key,
      required this.sintomas,
      required this.sendMessageBloc,
      required this.id,
      required this.many})
      : super(key: key);

  @override
  State<SintomasPage> createState() => _SintomasPageState();
}

class _SintomasPageState extends State<SintomasPage> {
  ValueNotifier<bool> searchVisibility = ValueNotifier(false);
  final TextEditingController textEditingController = TextEditingController();
  List<SintomaEntity> aux = [];

  @override
  void initState() {
    super.initState();
    aux = widget.sintomas;
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Selecione uma ou mais opções",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              searchVisibility.value = !searchVisibility.value;
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: searchVisibility,
              builder: (context, value, child) => Visibility(
                visible: searchVisibility.value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: textEditingController,
                      onChanged: (value) {
                        setState(() {
                          aux = widget.sintomas
                              .where((element) => element.name.contains(value))
                              .toList();
                        });
                      },
                      obscureText: false,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) {

                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {
                            searchVisibility.value = !searchVisibility.value;
                            setState(() {
                              aux = widget.sintomas;
                            });
                          },
                          icon: Icon(Icons.close),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(left: 12),
                        hintText: "Procure por um sintoma",
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 15, 86, 179)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 9, 87, 222),
                                width: 2),
                            borderRadius: BorderRadius.circular(15)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 9, 87, 222),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 8),
              itemCount: aux.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var item = aux[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, bottom: 4, top: 4),
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Checkbox(
                        value: item.selected,
                        onChanged: (value) {
                          if (widget.many == 0) {
                            if (ChatChangeNotifier.instance.sintomasSelecionados
                                    .value.isNotEmpty &&
                                item.name ==
                                    ChatChangeNotifier.instance
                                        .sintomasSelecionados.value.first) {
                              ChatChangeNotifier
                                  .instance.sintomasSelecionados.value
                                  .removeWhere(
                                      (element) => element == item.name);
                            }

                            if (ChatChangeNotifier.instance.sintomasSelecionados
                                    .value.isNotEmpty &&
                                item.name !=
                                    ChatChangeNotifier.instance
                                        .sintomasSelecionados.value.first) {
                              for (var element in widget.sintomas) {
                                if (element.name ==
                                    ChatChangeNotifier.instance
                                        .sintomasSelecionados.value.first) {
                                  setState(() {
                                    element.selected = false;
                                  });
                                }
                              }

                              ChatChangeNotifier
                                  .instance.sintomasSelecionados.value
                                  .clear();
                            }

                            if (ChatChangeNotifier
                                .instance.sintomasSelecionados.value.isEmpty) {
                              setState(() {
                                item.selected = !item.selected;
                              });

                              if (item.selected) {
                                ChatChangeNotifier
                                    .instance.sintomasSelecionados.value
                                    .add(item.name);
                              }
                            }
                          } else {
                            if (item.selected) {
                              ChatChangeNotifier
                                  .instance.sintomasSelecionados.value
                                  .removeWhere(
                                      (element) => element == item.name);
                            }

                            setState(() {
                              item.selected = !item.selected;
                            });

                            if (item.selected) {
                              ChatChangeNotifier
                                  .instance.sintomasSelecionados.value
                                  .add(item.name);
                            }
                          }

                          print(ChatChangeNotifier
                              .instance.sintomasSelecionados.value);
                        },
                      ),
                      title: Text(
                        item.name,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: ChatChangeNotifier.instance.sintomasSelecionados,
        builder: (context, value, child) => Visibility(
          visible:
              ChatChangeNotifier.instance.sintomasSelecionados.value.isNotEmpty,
          child: Container(
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey, offset: Offset(0, -2), blurRadius: 4)
              ]),
              height: kToolbarHeight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    widget.sendMessageBloc.add(SendMessageTextEvent(
                        ChatChangeNotifier.instance.sintomasSelecionados.value
                            .join(","),
                        widget.id));
                    ChatChangeNotifier.instance.chatMessages.value.add(
                        ChatMessageEntity(
                            ChatChangeNotifier
                                .instance.sintomasSelecionados.value
                                .join(","),
                            1));
                    ChatChangeNotifier.instance.sintomasSelecionados.value
                        .clear();
                    Modular.to.pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromARGB(255, 46, 134, 218),
                            width: 2)),
                    child: const Center(
                        child: Text(
                      "Enviar opções selecionadas",
                      style: TextStyle(
                          color: Color.fromARGB(255, 46, 134, 218),
                          fontSize: 18),
                    )),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
