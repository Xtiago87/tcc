import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicos_module/presenter/bloc/add_medic/add_medic_bloc.dart';
import 'package:medicos_module/presenter/bloc/add_medic/add_medic_event.dart';
import 'package:medicos_module/presenter/bloc/add_medic/add_medic_state.dart';

class PacienteButtonRow extends StatefulWidget {
  final String id;
  const PacienteButtonRow({Key? key, required this.id}) : super(key: key);

  @override
  _PacienteButtonRowState createState() => _PacienteButtonRowState();
}

class _PacienteButtonRowState extends State<PacienteButtonRow> {

  final AddMedicBloc addMedicBloc = Modular.get<AddMedicBloc>();
  final TextEditingController textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 16,
          ),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Modular.to.pushNamed("./chat",arguments: widget.id);
              },
              child: Image.asset("assets/images/chatbot_button.png")),
          const SizedBox(
            width: 24,
          ),
          GestureDetector(
              onTap: () {
                Modular.to.pushNamed("./centros_medicos");
              },
              child: Image.asset("assets/images/cm_button.png")),
          const SizedBox(
            width: 24,
          ),
          BlocProvider<AddMedicBloc>(
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
              child: GestureDetector(
                  onTap: () {
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
                                    .add(AddMedicEvent(textEditingController.text, widget.id));
                                Modular.to.pop();
                              },
                              child: const Text("Enviar solicitação"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Image.asset("assets/images/add_medic_button.png")),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          GestureDetector(
              onTap: () => Modular.to.pushNamed("./editar_perfil"),
              child: Image.asset("assets/images/editar_perfil_button.png")),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
