import 'package:core_module/presenter/components/sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicos_module/domain/entities/medical_center_form_entity.dart';
import 'package:medicos_module/presenter/bloc/add_medical_center/add_medical_center_bloc.dart';
import 'package:medicos_module/presenter/bloc/add_medical_center/add_medical_center_event.dart';
import 'package:medicos_module/presenter/bloc/add_medical_center/add_medical_center_state.dart';
import 'package:medicos_module/presenter/bloc/medical_center/medical_center_states.dart';

import '../../../../domain/entities/medical_center_entity.dart';
import '../../../bloc/medical_center/medical_center_bloc.dart';
import '../../../bloc/medical_center/medical_center_events.dart';
import '../paciente/components/centros_medicos_card.dart';

class CentrosMedicosMedicoPage extends StatefulWidget {
  const CentrosMedicosMedicoPage({Key? key}) : super(key: key);

  @override
  _CentrosMedicosMedicoPageState createState() =>
      _CentrosMedicosMedicoPageState();
}

class _CentrosMedicosMedicoPageState extends State<CentrosMedicosMedicoPage> {
  final ScrollController scrollController = ScrollController();
  final MedicalCenterBloc medicalCenterBloc = Modular.get<MedicalCenterBloc>();
  List<MedicalCenterEntity> list = [];
  final TextEditingController textEditingControllerCentro =
      TextEditingController();
  final TextEditingController textEditingControllerEndereco =
      TextEditingController();
  final TextEditingController textEditingControllerPlano =
      TextEditingController();
  final AddMedicalCenterBloc addMedicalCenterBloc =
      Modular.get<AddMedicalCenterBloc>();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    Modular.get<AddMedicalCenterBloc>();
    Modular.get<MedicalCenterBloc>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return BlocProvider<AddMedicalCenterBloc>(
                create: (context) => addMedicalCenterBloc,
                child:
                    BlocListener<AddMedicalCenterBloc, AddMedicalCenterState>(
                  listener: (context, state) {

                    if(state is AddMedicalCenterLoadingState){
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
                                          "Criando centro médico...",
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

                    if (state is AddMedicalCenterSuccessState) {
                      Modular.to.pop();
                      textEditingControllerCentro.clear();
                      textEditingControllerEndereco.clear();
                      textEditingControllerPlano.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Centro médico adicionado com success"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }

                    if(state is AddMedicalCenterFailureState){
                      Modular.to.pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    color: Colors.white,
                    child: Center(
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Center(child: Padding(
                                padding: EdgeInsets.only(right: 16, left: 16,top: 8),
                                child: Text("Preencha os campos abaixo para adicionar um novo centro médico", style: TextStyle(color: Colors.black, fontSize: 16), textAlign: TextAlign.center,),
                              )),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 16,
                                  top: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Nome",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      controller: textEditingControllerCentro,
                                      obscureText: false,
                                      style: const TextStyle(color: Colors.black),
                                      validator: (value) {
                                        if (value != null && value.isEmpty) {
                                          return "Campo não pode estar vazio";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.only(left: 12),
                                        hintText: "Digite o nome do centro médico",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 16,
                                  top: 24,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Endereço",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      controller: textEditingControllerEndereco,
                                      obscureText: false,
                                      style: const TextStyle(color: Colors.black),
                                      validator: (value) {
                                        if (value != null && value.isEmpty) {
                                          return "Campo não pode estar vazio";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.only(left: 12),
                                        hintText:
                                            "Digite o enedereço do centro médico",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 16,
                                  top: 24,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Plano de saúde",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      controller: textEditingControllerPlano,
                                      obscureText: false,
                                      style: const TextStyle(color: Colors.black),
                                      validator: (value) {
                                        if (value != null && value.isEmpty) {
                                          return "Campo não pode estar vazio";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.only(left: 12),
                                        hintText: "Digite o plano de saúde",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: ElevatedButton(
                                  child: const Text('Salvar'),
                                  onPressed: () {
                                    addMedicalCenterBloc.add(AddMedicalCenterEvent(MedicalCenterFormEntity(nome: textEditingControllerCentro.text, endereco: textEditingControllerEndereco.text, planoDeSaude: textEditingControllerPlano.text)));
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: BlocProvider<MedicalCenterBloc>(
        create: (context) =>
            medicalCenterBloc..add(GetAllMedicalCentersEvent()),
        child: BlocConsumer<MedicalCenterBloc, MedicalCenterState>(
          listener: (context, state) {
            if (state is MedicalCenterSuccessState) {
              list = state.list;
            }

            if (state is MedicalCenterFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) => SliverScrollView(
            scrollController: scrollController,
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
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ],
            title: const Text(
              "Centros médicos",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            body: Column(
              children: [
                if (state is MedicalCenterLoadingState)
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: const Center(child: CircularProgressIndicator())),
                if (state is MedicalCenterSuccessState)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var item = list[index];
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Modular.to.pushNamed("./detalhes_centro_medico",
                                arguments: item.id);
                          },
                          child: CentrosMedicosCard(
                            medicalCenterEntity: item,
                          ),
                        );
                      },
                      itemCount: list.length,
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
