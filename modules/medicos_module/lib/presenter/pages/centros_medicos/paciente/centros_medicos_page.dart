import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicos_module/domain/entities/medical_center_entity.dart';
import 'package:medicos_module/presenter/bloc/medical_center/medical_center_bloc.dart';
import 'package:medicos_module/presenter/bloc/medical_center/medical_center_events.dart';
import 'package:medicos_module/presenter/bloc/medical_center/medical_center_states.dart';

import 'components/centros_medicos_card.dart';

class CentrosMedicosPage extends StatefulWidget {
  const CentrosMedicosPage({super.key});

  @override
  State<CentrosMedicosPage> createState() => _CentrosMedicosPageState();
}

class _CentrosMedicosPageState extends State<CentrosMedicosPage> {
  final ScrollController scrollController = ScrollController();
  final MedicalCenterBloc medicalCenterBloc = Modular.get<MedicalCenterBloc>();
  List<MedicalCenterEntity> list = [];

  @override
  void dispose() {
    Modular.dispose<MedicalCenterBloc>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<MedicalCenterBloc>(
        create: (context) =>
            medicalCenterBloc..add(GetAllMedicalCentersEvent()),
        child: BlocConsumer<MedicalCenterBloc, MedicalCenterState>(
          listener: (context, state) {
            if (state is MedicalCenterSuccessState) {
              list = state.list;
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
                      height: MediaQuery.of(context).size.height/3,
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
                            Modular.to.pushNamed("./detalhes_centro_medico", arguments: item.id);
                          },
                          child: CentrosMedicosCard(medicalCenterEntity: item,),
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
