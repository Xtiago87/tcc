import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_module/patient_module.dart';

class MedicoButtonRow extends StatefulWidget {

  final int id;
  const MedicoButtonRow({Key? key, required this.id}) : super(key: key);

  @override
  _MedicoButtonRowState createState() => _MedicoButtonRowState();
}

class _MedicoButtonRowState extends State<MedicoButtonRow> {

  final GenerateTokenBloc generateTokenBloc = Modular.get<GenerateTokenBloc>();

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
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return BlocProvider<GenerateTokenBloc>(
                      create: (context) => generateTokenBloc..add(GetToken(widget.id)),
                      child: BlocBuilder<GenerateTokenBloc, GenerateTokenState>(
                        builder:(context, state) {
                          if(state is GenerateTokenSuccessState){
                            return AlertDialog(
                              title: const Center(child: Text("Compartilhe essa token com seu paciente para adiciona-lo", style: TextStyle(color: Colors.blue),)),
                              content: Wrap(
                                  alignment: WrapAlignment.center,
                                  children:[ Text(state.token, style: TextStyle(color: Colors.black),)]),
                              actionsAlignment: MainAxisAlignment.center,
                              actions: [
                                ElevatedButton(
                                  onPressed: () {

                                  },
                                  child: const Text("Copiar"),
                                )
                              ],

                            );
                          }
                          return AlertDialog(
                            content: Wrap(
                              alignment: WrapAlignment.center,
                                children: const [CircularProgressIndicator(),],) ,
                          );
                        },
                      ),
                    );
                  },
                );
              },
              child: Image.asset("assets/images/add_patient_button.png")),
          const SizedBox(
            width: 24,
          ),
          GestureDetector(
              onTap: () {
                Modular.to.pushNamed("./meus_centros_medicos");
              },
              child: Image.asset("assets/images/medic_medical_center_button.png")),
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
