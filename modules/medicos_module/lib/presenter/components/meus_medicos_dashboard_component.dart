import 'package:core_module/core_module.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicos_module/presenter/bloc/meus_medicos/meus_medicos_bloc.dart';
import 'package:medicos_module/presenter/bloc/meus_medicos/meus_medicos_event.dart';
import 'package:medicos_module/presenter/bloc/meus_medicos/meus_medicos_state.dart';
import 'package:medicos_module/presenter/components/medico_card.dart';

class MeusMedicosDashboardComponent extends StatelessWidget {
  MeusMedicosDashboardComponent({super.key, required this.perfilEntity});

  final MeusMedicosBloc medicosBloc = Modular.get<MeusMedicosBloc>();
  final PerfilEntity perfilEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MeusMedicosBloc>(
      create: (context) =>
          medicosBloc..add(GetMeusMedicosEvent(id: perfilEntity.uid)),
      child: BlocBuilder<MeusMedicosBloc, MeusMedicosState>(
        builder: (context, state) {
          if (state is MeusMedicosSuccessState) {
            return Column(
              children: [
                Visibility(
                  visible: state.list.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Meus médicos",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                          onPressed: () {
                            Modular.to.pushNamed("./meus_medicos", arguments: {
                              "list": state.list,
                              "id": perfilEntity.uid
                            });
                          },
                          child: const Text("Ver mais"),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: state.list.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.list.length,
                          itemBuilder: (context, index) {
                            var item = state.list[index];
                            return MedicoCard(
                              medicEntity: item,
                            );
                          },
                        )
                      : const Text(
                          "Você ainda não adicionou nenhum médico.",
                          style: TextStyle(color: Colors.black),
                        ),
                )
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
