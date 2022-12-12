import 'package:core_module/presenter/components/sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicos_module/domain/entities/medical_center_entity.dart';
import 'package:medicos_module/presenter/bloc/medical_center/medical_center_states.dart';

import '../../../bloc/medical_center/medical_center_bloc.dart';
import '../paciente/components/centros_medicos_card.dart';

class MeusCentrosMedicosPage extends StatefulWidget {
  const MeusCentrosMedicosPage({Key? key}) : super(key: key);

  @override
  _MeusCentrosMedicosPageState createState() => _MeusCentrosMedicosPageState();
}

class _MeusCentrosMedicosPageState extends State<MeusCentrosMedicosPage> {

  final ScrollController scrollController = ScrollController();
  final MedicalCenterBloc medicalCenterBloc = Modular.get<MedicalCenterBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: BlocProvider<MedicalCenterBloc>(
        create: (context) => medicalCenterBloc,
        child: BlocConsumer<MedicalCenterBloc, MedicalCenterState>(
          listener: (context, state) {

          },
          builder:(context, state) {
            if(state is MedicalCenterSuccessState){
              return SliverScrollView(
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
                  "Meus centros médicos",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item = state.list[index];
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                            },
                            child: CentrosMedicosCard(medicalCenterEntity: item),
                          );
                        },
                        itemCount: state.list.length,
                      ),
                    )
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
