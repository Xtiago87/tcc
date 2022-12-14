import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
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
                          state
                              .detalhesPacienteEntity.familyIllnesslist.isEmpty)
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
                                              "${translateDate(DateFormat.yMMMMEEEEd().format(DateTime(int.parse(item.date.split("-")[0]), int.parse(item.date.split("-")[1]), int.parse(item.date.split("T")[0].split("-")[2]))))}",
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
                                              "${translateDate(DateFormat.yMMMMEEEEd().format(DateTime(int.parse(item.date.split("-")[0]), int.parse(item.date.split("-")[1]), int.parse(item.date.split("T")[0].split("-")[2]))))}",
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
                                              "${translateDate(DateFormat.yMMMMEEEEd().format(DateTime(int.parse(item.date.split("-")[0]), int.parse(item.date.split("-")[1]), int.parse(item.date.split("T")[0].split("-")[2]))))}",
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
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  );
                }

                return SizedBox(
                  height: MediaQuery.of(context).size.height/2,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Center(
                          child: Text(
                            "Esse relatório foi gerado por uma IA",
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(color: Colors.blue),
                          )),
                      content: Wrap(
                        children: const [
                          Padding(
                            padding:
                            EdgeInsets.only(top: 0.0),
                            child: Text(
                              "Sintomas: sintomas",
                              style: TextStyle(
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color:  const Color.fromARGB(255, 46, 134, 218),
                    width: 2
                  )),
                child: const Center(child: Text("Pré diagnostico", style: TextStyle(color: Color.fromARGB(255, 46, 134, 218), fontSize: 18),)),
              ),
            ),
          )
      ),
    );
  }
}

String translateDate(String date) {
  var day = date.split(",")[0];
  var month = date.split(",")[1];

  if (day == "Sunday") {
    day = "Domingo";
  } else if (day == "Monday") {
    day = "Segunda-feira";
  } else if (day == "Tuesday") {
    day = "Terça-feira";
  } else if (day == "Wednesday") {
    day = "Quarta-feira";
  } else if (day == "Thursday") {
    day = "Quinta-feira";
  } else if (day == "Friday") {
    day = "Sexta-feira";
  } else if (day == "Saturday") {
    day = "Sábado";
  }

  if (month == "January") {
    month = "Janeiro";
  } else if (month == "February") {
    month = "Fevereiro";
  } else if (month == "March") {
    month = "Março";
  } else if (month == "April") {
    month = "Abril";
  } else if (month == "May") {
    month = "Maio";
  } else if (month == "June") {
    month = "Junho";
  } else if (month == "July ") {
    month = "Julho";
  } else if (month == "August") {
    month = "Agosto";
  } else if (month == "September") {
    month = "Setembro";
  } else if (month == "October ") {
    month = "Outubro";
  } else if (month == "November") {
    month = "Novembro";
  } else if (month == "December") {
    month = "Dezembro";
  }

  return "$day, $month ${date.split(",")[1].split("").last}, ${date.split(",").last}";
}
