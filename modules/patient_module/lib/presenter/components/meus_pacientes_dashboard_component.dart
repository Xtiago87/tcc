import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_module/presenter/bloc/meus_pacientes/meus_pacientes_bloc.dart';
import 'package:patient_module/presenter/bloc/meus_pacientes/meus_pacientes_event.dart';
import 'package:patient_module/presenter/bloc/meus_pacientes/meus_pacientes_state.dart';
import 'package:patient_module/presenter/components/paciente_card.dart';

class MeusPacientesDashboardComponent extends StatelessWidget {
  final int id;

  MeusPacientesDashboardComponent({super.key, required this.id});

  final MeusPacientesBloc meusPacientesBloc = Modular.get<MeusPacientesBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MeusPacientesBloc>(
      create: (context) => meusPacientesBloc..add(GetAllMyPacientesEvent(id)),
      child: BlocConsumer<MeusPacientesBloc, MeusPacientesState>(
        listener: (context, state) {
          if (state is MeusPacientesFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          if (state is MeusPacientesSuccessState) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Meus pacientes",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                        onPressed: () {
                          Modular.to.pushNamed("./meus_pacientes",
                              arguments: state.list);
                        },
                        child: const Text("Ver mais"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      var item = state.list[index];
                      return PatientCard(pacienteEntity: item);
                    },
                  ),
                ),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
