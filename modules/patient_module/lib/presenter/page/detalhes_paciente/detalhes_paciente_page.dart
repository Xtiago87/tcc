import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_module/presenter/bloc/detalhes_paciente/detalhes_paciente_event.dart';
import 'package:patient_module/presenter/bloc/detalhes_paciente/detalhes_paciente_state.dart';
import 'package:patient_module/presenter/page/detalhes_paciente/components/paciente_perfil_component.dart';

import '../../bloc/detalhes_paciente/detalhes_paciente_bloc.dart';

class DetalhesPacientePage extends StatefulWidget {
  final int pacientId;
  final int userId;

  const DetalhesPacientePage(
      {Key? key, required this.pacientId, required this.userId})
      : super(key: key);

  @override
  _DetalhesPacientePageState createState() => _DetalhesPacientePageState();
}

class _DetalhesPacientePageState extends State<DetalhesPacientePage> {
  final ScrollController scrollController = ScrollController();
  final DetalhesPacienteBloc detalhesPacienteBloc =
      Modular.get<DetalhesPacienteBloc>();

  @override
  void dispose() {
    Modular.dispose<DetalhesPacienteBloc>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<DetalhesPacienteBloc>(
        create: (context) => detalhesPacienteBloc
          ..add(GetDetalhesPaciente(widget.pacientId, widget.userId)),
        child: SafeArea(
          child: SliverScrollView(
            hasPaddingLeft: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 32,
              ),
              onPressed: () {
                Modular.to.pop();
              },
            ),
            title: const Text(
              "Detalhes do paciente",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
              overflow: TextOverflow.ellipsis,
            ),
            scrollController: scrollController,
            body: BlocConsumer<DetalhesPacienteBloc, DetalhesPacienteState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is DetalhesPacienteSuccessState) {
                  return ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      PacientePerfilComponent(
                          nome: state.detalhesPacienteEntity.fullName,
                          email: state.detalhesPacienteEntity.email),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16),
                        child: Text(
                          "Doenças",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      if (state.detalhesPacienteEntity.illnessList.isEmpty &&
                          state.detalhesPacienteEntity.familyIllnesslist.isEmpty)
                       const Padding(
                            padding: EdgeInsets.only(left: 16.0, right: 16),
                            child: Center(
                                child: Text(
                              "Paciente ainda não cadastrou nenhuma doença",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.normal),
                            ))),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            state.detalhesPacienteEntity.illnessList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item =
                              state.detalhesPacienteEntity.illnessList[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 4.0, left: 16, right: 16, top: 4),
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Center(
                                          child: Text(
                                        item.name,
                                        style:
                                            const TextStyle(color: Colors.blue),
                                      )),
                                      content: Wrap(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 0.0),
                                            child: Text(
                                              "Sintomas: ${item.symptoms}",
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 4,
                                                bottom: 4),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 67, 136, 255),
                                                  Color.fromARGB(
                                                      255, 90, 202, 226),
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                            ),
                                            child: Text(
                                              //TODO
                                              "Hoje - ${item.date}",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.coronavirus_outlined),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                item.name,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: const [
                                              Icon(Icons.info_outline),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                "Mais informações",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 48,
                                        color:
                                            Color.fromARGB(255, 160, 160, 160),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: state
                            .detalhesPacienteEntity.familyIllnesslist.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item = state
                              .detalhesPacienteEntity.familyIllnesslist[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 4.0, left: 16, right: 16, top: 4),
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Center(
                                          child: Text(
                                        item.name,
                                        style:
                                            const TextStyle(color: Colors.blue),
                                      )),
                                      content: Wrap(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 0.0),
                                            child: Text(
                                              "Sintomas: ${item.symptoms}",
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 4,
                                                bottom: 4),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 67, 136, 255),
                                                  Color.fromARGB(
                                                      255, 90, 202, 226),
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                            ),
                                            child: Text(
                                              //TODO
                                              "Hoje - ${item.date}",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.coronavirus_outlined),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                item.name,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: const [
                                              Icon(Icons.info_outline),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                "Mais informações",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 48,
                                        color:
                                            Color.fromARGB(255, 160, 160, 160),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16, top: 8, bottom: 8),
                        child: Text(
                          "Alergias",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      if (state.detalhesPacienteEntity.alergyList.isEmpty)
                        const Padding(
                            padding: EdgeInsets.only(left: 16.0, right: 16),
                            child: Center(
                                child: Text(
                              "Paciente ainda não cadastrou nenhuma doença",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.normal),
                            ))),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            state.detalhesPacienteEntity.alergyList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item =
                              state.detalhesPacienteEntity.alergyList[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 4.0, left: 16, right: 16, top: 4),
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {},
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 4,
                                                bottom: 4),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 67, 136, 255),
                                                  Color.fromARGB(
                                                      255, 90, 202, 226),
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                            ),
                                            child: Text(
                                              "Hoje - ${item.date}",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.coronavirus_outlined),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                item.name,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                        ],
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 48,
                                        color: Colors.transparent,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
