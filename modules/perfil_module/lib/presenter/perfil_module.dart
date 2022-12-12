import 'package:core_module/presenter/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:perfil_module/domain/usecase/editar_perfil_medico_usecase.dart';
import 'package:perfil_module/domain/usecase/editar_perfil_paciente_usecase.dart';
import 'package:perfil_module/external/datasources/editar_perfil_datasource_impl.dart';
import 'package:perfil_module/external/datasources/remote/editar_perfil_medico_datasource_remote_impl.dart';
import 'package:perfil_module/external/datasources/remote/editar_perfil_paciente_datasource_remote_impl.dart';
import 'package:perfil_module/external/datasources/remote/update_photo_datasource_remote_impl.dart';
import 'package:perfil_module/external/datasources/update_photo_datasource_impl.dart';
import 'package:perfil_module/infra/repositories/editar_perfil_repository_impl.dart';
import 'package:perfil_module/infra/repositories/photo_repository_impl.dart';
import 'package:perfil_module/presenter/bloc/perfil/perfil_bloc.dart';
import 'package:perfil_module/presenter/bloc/update_photo/update_photo_bloc.dart';
class PerfilModule extends Module {

  @override
  List<Module> get imports => [CoreModule()];

  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => EditarPerfilPacienteDatasourceRemoteImpl(), export: true),
        Bind.lazySingleton((i) => EditarPerfilMedicoDatasourceRemoteImpl(), export: true),
        Bind.lazySingleton((i) => EditarPerfilDatasourceImpl(i(), i()), export: true),
        Bind.lazySingleton((i) => UpdatePhotoDatasourceRemoteImpl(), export: true),
        Bind.lazySingleton((i) => UpdatePhotoDatasourceImpl(i()), export: true),

        Bind.lazySingleton((i) => PhotoRepositoryImpl(i()), export: true),
        Bind.lazySingleton((i) => EditarPerfilRepositoryImpl(i()), export: true),

        Bind.lazySingleton((i) => EditarPerfilPacienteUsecase(i()), export: true),
        Bind.lazySingleton((i) => EditarPerfilMedicoUsecase(i()), export: true),

        Bind.factory((i) => PerfilBloc(), export: true),
        Bind.factory((i) => UpdatePhotoBloc(), export: true),
      ];
}
