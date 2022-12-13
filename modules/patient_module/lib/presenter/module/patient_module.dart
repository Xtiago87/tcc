import 'package:flutter_modular/flutter_modular.dart';
import 'package:patient_module/domain/usecase/get_all_my_pacientes_usecase.dart';
import 'package:patient_module/domain/usecase/get_detalhes_pacient_usecase.dart';
import 'package:patient_module/domain/usecase/get_token_usecase.dart';
import 'package:patient_module/external/datasources/add_user_datasource_impl.dart';
import 'package:patient_module/external/datasources/patient_datasource_impl.dart';
import 'package:patient_module/external/datasources/remote/get_token_datasource_remote_impl.dart';
import 'package:patient_module/external/datasources/remote/patient_datasource_remote_impl.dart';
import 'package:patient_module/infra/repositories/add_user_repository_impl.dart';
import 'package:patient_module/infra/repositories/patient_repository_impl.dart';
import 'package:patient_module/presenter/bloc/detalhes_paciente/detalhes_paciente_bloc.dart';
import 'package:patient_module/presenter/bloc/generate_token/generate_token_bloc.dart';
import 'package:patient_module/presenter/bloc/meus_pacientes/meus_pacientes_bloc.dart';

class PatientModule extends Module{

  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton((i) => GetTokenDatasourceRemoteImpl(), export: true),
    Bind.lazySingleton((i) => AddUserDatasourceImpl(i()), export: true),
    Bind.lazySingleton((i) => AddUserRepositoryImpl(i()), export: true),
    Bind.lazySingleton((i) => GetTokenUsecase(i()), export: true),
    Bind.lazySingleton((i) => GetDetalhesPacientUsecase(i()), export: true),
    Bind.factory((i) => GenerateTokenBloc(), export: true),


    Bind.lazySingleton((i) => PatientDatasourceRemoteImpl(), export: true),
    Bind.lazySingleton((i) => PatientDatasourceImpl(i()), export: true),
    Bind.lazySingleton((i) => PacienteRepositoryImpl(i()), export: true),
    Bind.lazySingleton((i) => GetAllMyPacientesUsecase(i()), export: true),
    Bind.factory((i) => MeusPacientesBloc(), export: true),
    Bind.factory((i) => DetalhesPacienteBloc(), export: true),
  ];
}