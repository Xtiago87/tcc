import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_module/presenter/page/detalhes_paciente/components/paciente_perfil_component.dart';

class DetalhesPacientePage extends StatefulWidget {
  const DetalhesPacientePage({Key? key}) : super(key: key);

  @override
  _DetalhesPacientePageState createState() => _DetalhesPacientePageState();
}

class _DetalhesPacientePageState extends State<DetalhesPacientePage> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SliverScrollView(
          hasPaddingLeft: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 32,
            ),
            onPressed: () {
              Modular.to.pop();
            },
          ),
          title: Text(
            "Detalhes do paciente",
            style: Theme.of(context).textTheme.headline6,
            overflow: TextOverflow.ellipsis,
          ),
          scrollController: scrollController,
          body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              const PacientePerfilComponent(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Text(
                  "Doenças",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
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
                              title: Center(child: Text("Nome da doença", style: TextStyle(color: Colors.blue),)),
                              content: Wrap(
                                children: const [
                                   Text("Descrição: Lorem ipsum"),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text("Sintomas: Lorem ipsum"),
                                  ),
                                ],
                              ) ,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 4, bottom: 4),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 67, 136, 255),
                                          Color.fromARGB(255, 90, 202, 226),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                    ),
                                    child: Text(
                                      "Hoje - 18:30",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: const [
                                      Icon(Icons.coronavirus_outlined),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Nome da doença",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
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
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 48,
                                color: Color.fromARGB(255, 160, 160, 160),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16, top: 8, bottom: 8),
                child: Text(
                  "Alergias",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
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
                              title: Center(child: Text("Nome da doença", style: TextStyle(color: Colors.blue),)),
                              content: Wrap(
                                children: const [
                                  Text("Descrição: Lorem ipsum"),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text("Sintomas: Lorem ipsum"),
                                  ),
                                ],
                              ) ,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 8, right: 8, top: 4, bottom: 4),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 67, 136, 255),
                                          Color.fromARGB(255, 90, 202, 226),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                    ),
                                    child: Text(
                                      "Hoje - 18:30",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: const [
                                      Icon(Icons.coronavirus_outlined),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Nome da doença",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
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
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 48,
                                color: Color.fromARGB(255, 160, 160, 160),
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
          ),
        ),
      ),
    );
  }
}
