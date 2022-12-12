import 'package:core_module/presenter/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:perfil_module/domain/usecase/editar_perfil_medico_usecase.dart';
import 'package:perfil_module/domain/usecase/editar_perfil_paciente_usecase.dart';
import 'package:perfil_module/external/datasources/editar_perfil_datasource_impl.dart';
import 'package:perfil_module/external/datasources/remote/editar_perfil_medico_datasource_remote_impl.dart';
import 'package:perfil_module/external/datasources/remote/editar_perfil_paciente_datasource_remote_impl.dart';
import 'package:perfil_module/infra/repositories/editar_perfil_repository_impl.dart';
import 'package:perfil_module/presenter/bloc/perfil/perfil_bloc.dart';
class PerfilModule extends Module {
  @override
  // TODO: implement imports
  List<Module> get imports => [CoreModule()];

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => EditarPerfilPacienteDatasourceRemoteImpl(), export: true),
        Bind((i) => EditarPerfilMedicoDatasourceRemoteImpl(), export: true),
        Bind((i) => EditarPerfilDatasourceImpl(i(), i()), ),
        Bind((i) => EditarPerfilRepositoryImpl(i()), export: true),
        Bind((i) => EditarPerfilPacienteUsecase(i()), export: true),
        Bind((i) => EditarPerfilMedicoUsecase(i()), export: true),
        Bind((i) => PerfilBloc(), export: true),
      ];

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [];
}
