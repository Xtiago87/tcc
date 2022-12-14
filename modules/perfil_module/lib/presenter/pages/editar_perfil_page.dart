import 'package:core_module/core_module.dart';
import 'package:core_module/presenter/components/sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:perfil_module/presenter/pages/components/editar_form_medico.dart';
import 'package:perfil_module/presenter/pages/components/editar_form_paciente.dart';

class EditarPerfilPage extends StatefulWidget {
  const EditarPerfilPage({super.key});

  @override
  State<EditarPerfilPage> createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SliverScrollView(
        isScrollable: true,
        hasPaddingLeft: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 28,
          ),
          onPressed: () {
            Modular.to.pop();
          },
        ),
        title: const Text(
          "Edite seus dados",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        scrollController: scrollController,
        body: SizedBox(
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const SizedBox(
                height: 16,
              ),
              CircleAvatar(
                radius: 100,
                backgroundImage: const NetworkImage(
                  "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
                ),
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  child: const Text(
                    "Clique para mudar sua foto",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              FutureBuilder<String>(
                future: AuthServiceImpl().readUserType(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                        child: Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 227, 242, 253),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: snapshot.data == "0"
                                ? const EditarFormMedico()
                                : const EditarFormPaciente()));
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
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
