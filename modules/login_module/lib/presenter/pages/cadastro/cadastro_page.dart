// ignore_for_file: prefer_const_constructors

import 'package:core_module/presenter/components/sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_module/presenter/bloc/cadastro_medico/cadastro_medico_bloc.dart';
import 'package:login_module/presenter/bloc/cadastro_medico/cadastro_medico_state.dart';
import 'package:login_module/presenter/bloc/cadastro_paciente/cadastro_paciente_bloc.dart';
import 'package:login_module/presenter/bloc/cadastro_paciente/cadastro_paciente_state.dart';
import 'package:login_module/presenter/pages/cadastro/components/form_paciente.dart';
import 'package:login_module/presenter/pages/cadastro/components/form_profissional_saude.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final ScrollController scrollController = ScrollController();
  final ValueNotifier<int> isMedic = ValueNotifier(0);
  final PageController pageController = PageController();
  final CadastroPacienteBloc cadastroPacienteBloc =
      Modular.get<CadastroPacienteBloc>();
  final CadastroMedicoBloc cadastroMedicoBloc = Modular.get<CadastroMedicoBloc>();
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => cadastroPacienteBloc,
          ),
          BlocProvider(create: (context) => cadastroMedicoBloc,),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<CadastroPacienteBloc, CadastroPacienteState>(
              listener: (context, state) {
                if (state is CadastroPacienteSuccessState) {
                  Modular.to.pushNamed("/dashboard");
                }

                if (state is CadastroPacienteLoadingState) {
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
                                      "Entrando no aplicativo...",
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

                if (state is CadastroPacienteFailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
            BlocListener<CadastroMedicoBloc, CadastroMedicoState>(
              listener: (context, state) {
                if (state is CadastroMedicoSuccessState) {
                  Modular.to.pop();
                  Modular.to.pushNamed("/dashboard");
                }

                if (state is CadastroMedicoLoadingState) {
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
                                      "Entrando no aplicativo...",
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


                if (state is CadastroMedicoFailureState) {
                  Modular.to.pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ],
          child: SliverScrollView(
            scrollController: scrollController,
            title: const Text(
              "Cadastro",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            hasPaddingLeft: true,
            leading: IconButton(
              onPressed: () {
                Modular.to.pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: isMedic,
                  builder: (context, value, child) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: RadioListTile(
                          value: 0,
                          groupValue: isMedic.value,
                          onChanged: (value) {
                            isMedic.value = 0;
                          },
                          title: Text(
                            "Paciente",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          value: 1,
                          groupValue: isMedic.value,
                          onChanged: (value) {
                            isMedic.value = 1;
                          },
                          title: Text(
                            "Profissional da saúde",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: isMedic,
                  builder: (context, value, child) => Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 227, 242, 253),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: isMedic.value == 0
                        ? FormPaciente(
                            cadastroPacienteBloc: cadastroPacienteBloc,
                          )
                        : FormProfissionalDaSaude(cadastroMedicoBloc: cadastroMedicoBloc),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
