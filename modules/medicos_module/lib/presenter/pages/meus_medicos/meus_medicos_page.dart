import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicos_module/presenter/bloc/add_medic/add_medic_bloc.dart';
import 'package:medicos_module/presenter/bloc/add_medic/add_medic_event.dart';
import 'package:medicos_module/presenter/bloc/add_medic/add_medic_state.dart';
import 'package:medicos_module/presenter/components/medico_card.dart';

import '../../../domain/entities/medic_entity.dart';

class MeusMedicosPage extends StatelessWidget {
  MeusMedicosPage({super.key, required this.list, required this.id});

  final ScrollController scrollController = ScrollController();
  final List<MedicEntity> list;
  final String id;
  final TextEditingController textEditingController = TextEditingController();
  final AddMedicBloc addMedicBloc = Modular.get<AddMedicBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  "Digite aqui o token para adicionar um médico.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                content: TextFormField(
                  controller: textEditingController,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Digite aqui a token",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      addMedicBloc
                          .add(AddMedicEvent(textEditingController.text, id));
                      Modular.to.pop();
                    },
                    child: const Text("Enviar solicitação"),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      body: BlocProvider<AddMedicBloc>(
        create: (context) => addMedicBloc,
        child: BlocListener<AddMedicBloc, AddMedicState>(
          listener: (context, state) {
            if (state is AddMedicLoadingState) {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: const [
                        CircularProgressIndicator(),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 32.0),
                            child: Text(
                              "Enviando solicitação...",
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
                },
              );
            }

            if (state is AddMedicSuccessState) {
              Modular.to.pop();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Solicitação enviada com sucesso!"), backgroundColor: Colors.green,));
            }

            if (state is AddMedicFailureState) {
              Modular.to.pop();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red,));
            }
          },
          child: SliverScrollView(
            scrollController: scrollController,
            hasPaddingLeft: true,
            leading: IconButton(
              onPressed: () {
                Modular.to.pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 28,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 28,
                  color: Colors.black,
                ),
              ),
            ],
            title: const Text(
              "Meus médicos",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            body: ListView.builder(
              padding: const EdgeInsets.only(left: 16, right: 16),
              itemCount: list.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var item = list[index];
                return MedicoCard(
                  medicEntity: item,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
