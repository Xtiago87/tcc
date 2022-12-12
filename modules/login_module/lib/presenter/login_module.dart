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
        Bind((i) => CadatroPacienteDatasourceRemoteImpl(), export: true),
        Bind((i) => CadastroMedicoDatasourceRemoteImpl(), export: true),
        Bind(
            (i) => CadastroDatasoruceImpl(
                iCadastroPacienteDatasourceRemote: i(),
                iCadastroMedicoDatasourceRemote: i()),
            export: true),
        Bind((i) => CadastroRepositoryImpl(i()), export: true),
        Bind((i) => CadastroPacienteUsecase(cadastroRepository: i()),
            export: true),
        Bind((i) => CadastroMedicoUsecase(cadastroRepository: i()),
            export: true),
        Bind((i) => CadastroPacienteBloc(), export: true),
        Bind((i) => CadastroMedicoBloc(), export: true),
        Bind((i) => LoginDataSourceRemoteImpl(), export: true),
    Bind((i) => LoginDatasourceImpl(i()), export: true),
        Bind((i) => LoginRepositoryImpl(i()), export: true),
        Bind((i) => LoginBloc(), export: true),
        Bind((i) => LoginUsecase(repository: i()), export: true),
      ];
}
