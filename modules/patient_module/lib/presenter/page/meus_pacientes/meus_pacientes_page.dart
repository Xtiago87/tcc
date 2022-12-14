import 'package:core_module/core_module.dart';
import 'package:core_module/presenter/components/sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../components/paciente_card.dart';

class MeusPacientesPage extends StatefulWidget {
  const MeusPacientesPage({Key? key, required this.list, required this.id})
      : super(key: key);
  final int id;
  final List<PacienteEntity> list;

  @override
  _MeusPacientesPageState createState() => _MeusPacientesPageState();
}

class _MeusPacientesPageState extends State<MeusPacientesPage> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            size: 28,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 28,
              color: Colors.black,
            ),
          ),
        ],
        title: const Text(
          "Meus pacientes",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        body: widget.list.isEmpty
            ? const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16),
                child: Center(
                  child: Text("Você ainda não adicionou nenhum paciente", style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                  textAlign: TextAlign.center,),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.list.length,
                  itemBuilder: (context, index) {
                    var item = widget.list[index];
                    return PatientCard(
                      pacienteEntity: item,
                      userId: widget.id,
                    );
                  },
                ),
              ),
      ),
    );
  }
}
