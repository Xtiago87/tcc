import 'package:core_module/core_module.dart';
import 'package:core_module/domain/usecase/get_perfil_usecase.dart';
import 'package:core_module/external/local/perfil_datasource_local_impl.dart';
import 'package:core_module/infra/repositories/perfil_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';


class CoreModule extends Module {
  
  @override
  List<Bind<Object>> get binds => [
    Bind.singleton((i) => PerfilDatasourceLocalImpl(), export: true),
    Bind((i) => PerfilDatasourceImpl(i()), export: true),
    Bind((i) => PerfilRepositoryImpl(i()), export: true),
    Bind((i) => GetPerfilUsecase(i()), export: true),
  ];
}
