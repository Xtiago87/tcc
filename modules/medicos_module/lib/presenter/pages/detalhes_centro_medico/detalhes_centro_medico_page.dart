import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicos_module/domain/usecase/paciente/get_medical_center_details_usecase.dart';
import 'package:medicos_module/presenter/bloc/medical_center_detail/medical_center_detail_bloc.dart';
import 'package:medicos_module/presenter/bloc/medical_center_detail/medical_center_detail_state.dart';
import 'package:medicos_module/presenter/components/medico_card.dart';

import '../../../domain/entities/medic_entity.dart';
import '../../bloc/medical_center_detail/medical_center_detail_event.dart';

class DetalhesCentroMedico extends StatelessWidget {
  DetalhesCentroMedico({super.key, required this.id});

  final ScrollController scrollController = ScrollController();
  final MedicalCenterDetailBloc medicalCenterDetailBloc = Modular.get<MedicalCenterDetailBloc>();
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<MedicalCenterDetailBloc>(
        create: (context) => medicalCenterDetailBloc..add(GetMedicalCenterDetailEvent(id)),
        child: BlocConsumer<MedicalCenterDetailBloc, MedicalCenterDetailState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            if(state is MedicalCenterDetailSuccessState){
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
                    onPressed: () {
                      Modular.to.pop();
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
                title: const Text(
                  "Médicos",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
                ),
                body: ListView.builder(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  itemCount: state.list.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var item = state.list[index];
                    return MedicoCard(medicEntity: item,);
                  },
                ),
              );
            }

            return SizedBox(
              height: MediaQuery.of(context).size.height/ 2,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );

          },
        ),
      ),
    );
  }
}
