import 'package:core_module/presenter/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_module/presenter/login_module.dart';
import 'package:login_module/presenter/pages/cadastro/cadastro_page.dart';
import 'package:login_module/presenter/pages/login/login_page.dart';
import 'package:login_module/presenter/pages/recuperar_senha/recuperar_senha_page.dart';
import 'package:medicos_module/medicos_module.dart';
import 'package:medicos_module/presenter/medicos_module.dart';
import 'package:navigation_module/presenter/pages/dashboard/dashboard_page.dart';
import 'package:patient_module/patient_module.dart';
import 'package:patient_module/presenter/module/patient_module.dart';
import 'package:patient_module/presenter/page/detalhes_paciente/detalhes_paciente_page.dart';
import 'package:perfil_module/perfil_module.dart';
import 'package:perfil_module/presenter/perfil_module.dart';

class NavigationModule extends Module {
  @override
  List<Module> get imports =>
      [PerfilModule(), MedicosModule(), LoginModule(), PatientModule(), CoreModule()];

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => LoginPage(),
        ),
        ChildRoute(
          "/recuperar_senha",
          child: (context, args) => const RecuperarSenhaPage(),
        ),
        ChildRoute(
          "/cadastro",
          child: (context, args) => const CadastroPage(),
        ),
        ChildRoute(
          "/dashboard",
          child: (context, args) => const DashboardPage(),
        ),
        ChildRoute(
          "/editar_perfil",
          child: (context, args) => const EditarPerfilPage(),
        ),
        ChildRoute(
          "/centros_medicos",
          child: (context, args) => const CentrosMedicosPage(),
        ),
        ChildRoute(
          "/detalhes_centro_medico",
          child: (context, args) => DetalhesCentroMedico(id: args.data),
        ),
        ChildRoute(
          "/meus_medicos",
          child: (context, args) => MeusMedicosPage(list: args.data["list"], id: args.data["id"]),
        ),
        ChildRoute(
          "/detalhes_paciente",
          child: (context, args) => const DetalhesPacientePage(),
        ),
        ChildRoute(
          "/meus_pacientes",
          child: (context, args) => MeusPacientesPage(list: args.data),
        ),
        ChildRoute(
          "/meus_centros_medicos",
          child: (context, args) => const CentrosMedicosMedicoPage(),
        ),
      ];
}
