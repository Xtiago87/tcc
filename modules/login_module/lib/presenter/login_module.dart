import 'package:core_module/presenter/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_module/domain/usecase/cadastro_medico_usecase.dart';
import 'package:login_module/domain/usecase/cadastro_paciente_usecase.dart';
import 'package:login_module/domain/usecase/login_usecase.dart';
import 'package:login_module/external/datasources/cadastro_datasource_impl.dart';
import 'package:login_module/external/datasources/login_datasource_impl.dart';
import 'package:login_module/external/datasources/remote/cadastro_medico_datasource_remote_impl.dart';
import 'package:login_module/external/datasources/remote/login_datasource_remote_impl.dart';
import 'package:login_module/infra/datasources/remote/icadastro_paciente_datasource_remote.dart';
import 'package:login_module/infra/repositories/cadastro_repository_impl.dart';
import 'package:login_module/infra/repositories/login_repository_impl.dart';
import 'package:login_module/presenter/bloc/cadastro_medico/cadastro_medico_bloc.dart';
import 'package:login_module/presenter/bloc/cadastro_paciente/cadastro_paciente_bloc.dart';

import '../external/datasources/remote/cadastro_paciente_datasource_remote_impl.dart';
import 'bloc/login/login_bloc.dart';

class LoginModule extends Module {

  @override
  List<Module> get imports => [CoreModule()];

  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => CadatroPacienteDatasourceRemoteImpl(), export: true),
        Bind.lazySingleton((i) => CadastroMedicoDatasourceRemoteImpl(), export: true),
        Bind.lazySingleton((i) => CadastroDatasoruceImpl(iCadastroPacienteDatasourceRemote: i(), iCadastroMedicoDatasourceRemote: i()), export: true),
        Bind.lazySingleton((i) => CadastroRepositoryImpl(i()), export: true),
        Bind.lazySingleton((i) => CadastroPacienteUsecase(cadastroRepository: i()), export: true),
        Bind.lazySingleton((i) => CadastroMedicoUsecase(cadastroRepository: i()), export: true),
        Bind.factory((i) => CadastroPacienteBloc(), export: true),
        Bind.factory((i) => CadastroMedicoBloc(), export: true),
        Bind.lazySingleton((i) => LoginDataSourceRemoteImpl(), export: true),
        Bind.lazySingleton((i) => LoginDatasourceImpl(i()), export: true),
        Bind.lazySingleton((i) => LoginRepositoryImpl(i()), export: true),
        Bind.factory((i) => LoginBloc(), export: true),
        Bind.lazySingleton((i) => LoginUsecase(repository: i()), export: true),
      ];
}
