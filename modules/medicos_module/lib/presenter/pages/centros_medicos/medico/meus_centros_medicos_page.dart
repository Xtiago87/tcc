import 'package:core_module/presenter/components/sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicos_module/domain/entities/medical_center_entity.dart';

import '../paciente/components/centros_medicos_card.dart';

class MeusCentrosMedicosPage extends StatefulWidget {
  const MeusCentrosMedicosPage({Key? key}) : super(key: key);

  @override
  _MeusCentrosMedicosPageState createState() => _MeusCentrosMedicosPageState();
}

class _MeusCentrosMedicosPageState extends State<MeusCentrosMedicosPage> {

  final ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: SliverScrollView(
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
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                      },
                      child: CentrosMedicosCard(medicalCenterEntity: MedicalCenterEntity(
                        id: 12,
                        name: "abcs",
                        healthPlan: "cas",
                        adress: "adfsa"
                      ),),
                    );
                  },
                  itemCount: 5,
                ),
              )
          ],
        ),
      ),
    );
  }
}
