import 'package:core_module/infra/service/auth_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicos_module/presenter/components/meus_medicos_dashboard_component.dart';
import 'package:navigation_module/presenter/pages/dashboard/components/medico_button_row.dart';
import 'package:navigation_module/presenter/pages/dashboard/components/paciente_button_row.dart';
import 'package:patient_module/patient_module.dart';
import 'package:perfil_module/presenter/bloc/perfil/perfil_bloc.dart';
import 'package:perfil_module/presenter/bloc/perfil/perfil_event.dart';
import 'package:perfil_module/presenter/bloc/perfil/perfil_state.dart';
import 'package:perfil_module/presenter/components/perfil_dashboard_component.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {



  final PerfilBloc perfilBloc = Modular.get<PerfilBloc>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider<PerfilBloc>(
            create: (context) {
              return perfilBloc..add(GetPerfil());
            },
            child: BlocBuilder<PerfilBloc, PerfilState>(
              builder:(context, state) {
                if(state is PerfilSuccessState){
                  return FutureBuilder<String>(
                    future: AuthServiceImpl().readUserType(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        //medic
                        if(snapshot.data == "0"){
                          return Column(
                            children: [
                              PerfilDashboardComponent(),
                              const SizedBox(
                                height: 16,
                              ),
                              MedicoButtonRow(id: int.parse(state.perfilEntity.uid)),
                              const SizedBox(
                                height: 24,
                              ),
                              MeusPacientesDashboardComponent(id: int.parse(state.perfilEntity.uid),),
                            ],
                          );
                        }else{
                          return Column(
                            children: [
                              PerfilDashboardComponent(),
                              const SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0, right: 16),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color.fromARGB(255, 67, 136, 255),
                                        Color.fromARGB(255, 90, 202, 226),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.white,
                                          backgroundImage:
                                          AssetImage("assets/images/chatbot_image.png"),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(8),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                  borderSide:
                                                  const BorderSide(color: Colors.white),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                  borderSide:
                                                  const BorderSide(color: Colors.white),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                  borderSide:
                                                  const BorderSide(color: Colors.white),
                                                ),
                                                hintText: "Fale com o Chatbot",
                                                hintStyle:
                                                const TextStyle(color: Colors.white)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              PacienteButtonRow(id: state.perfilEntity.uid),
                              const SizedBox(
                                height: 24,
                              ),
                              MeusMedicosDashboardComponent(perfilEntity: state.perfilEntity,),
                            ],
                          );
                        }
                      }
                      return SizedBox(
                        height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(color: Colors.red,),
                );
              },
            ),
          )
          ),
        ),
    );
  }
}
