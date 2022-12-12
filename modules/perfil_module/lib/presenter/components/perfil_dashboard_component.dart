import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/perfil/perfil_bloc.dart';
import '../bloc/perfil/perfil_event.dart';
import '../bloc/perfil/perfil_state.dart';

class PerfilDashboardComponent extends StatelessWidget {


  final PerfilBloc perfilBloc = Modular.get<PerfilBloc>();

  PerfilDashboardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: AuthServiceImpl().readUserType(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //medico
          return BlocProvider<PerfilBloc>(
            create: (context) => perfilBloc..add(GetPerfil()),
            child: BlocBuilder<PerfilBloc, PerfilState>(
              builder: (context, state) {
                if (state is PerfilSuccessState) {
                  return Column(
                    children: [
                      SizedBox(
                        height: kToolbarHeight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Modular.to.navigate("./");
                                },
                                icon: const Icon(Icons.logout),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blue,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        state.perfilEntity.fullName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            const Icon(Icons.alternate_email_outlined),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              state.perfilEntity.email,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        indent: 16,
                        endIndent: 16,
                        thickness: 1,
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
