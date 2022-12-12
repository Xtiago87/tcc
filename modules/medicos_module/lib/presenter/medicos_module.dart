import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicos_module/domain/usecase/paciente/add_medic_usecase.dart';
import 'package:medicos_module/domain/usecase/paciente/get_medical_center_details_usecase.dart';
import 'package:medicos_module/domain/usecase/paciente/get_my_medics_usecase.dart';
import 'package:medicos_module/domain/usecase/paciente/list_all_medical_centers_usecase.dart';
import 'package:medicos_module/external/datasources/paciente/medic_datasource.dart';
import 'package:medicos_module/external/datasources/paciente/medical_center_datasource_impl.dart';
import 'package:medicos_module/external/datasources/paciente/remote/get_all_my_medics_datasource_remote_impl.dart';
import 'package:medicos_module/external/datasources/paciente/remote/request_to_link_datasource_remote_impl.dart';
import 'package:medicos_module/infra/repositories/medic_repository_impl.dart';
import 'package:medicos_module/infra/repositories/medical_center_repository_impl.dart';
import 'package:medicos_module/presenter/bloc/add_medic/add_medic_bloc.dart';
import 'package:medicos_module/presenter/bloc/medical_center_detail/medical_center_detail_bloc.dart';
import 'package:medicos_module/presenter/bloc/meus_medicos/meus_medicos_bloc.dart';
import '../external/datasources/paciente/remote/get_all_medical_centers_datasource_remote_impl.dart';
import '../external/datasources/paciente/remote/get_medical_center_details_datasource_remote_impl.dart';
import 'bloc/medical_center/medical_center_bloc.dart';

class MedicosModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind((i) => GetMedicalCenterDetailsDatasourceRemoteImpl(),export: true),
    Bind((i) => GetAllMedicalCentersDatasourceRemoteImpl(),export: true),
    Bind((i) => MedicalCenterDatasourceImpl(i(), i()), export: true),
    Bind((i) => RequestToLinkDatasourceRemoteImpl(), export: true),
    Bind((i) => GetAllMyMedicsDatasourceRemoteImpl(), export: true),
    Bind((i) => MedicDatasourceImpl(i(), i()), export: true),
    Bind((i) => MedicRepositoryImpl(i()), export: true),
    Bind((i) => GetMyMedicsUsecase(i()), export: true),
    Bind((i) => MedicalCenterRespositoryImpl(i()),
    export: true),
        Bind(
          (i) => ListAllMedicalCentersUsecase(
              iMedicalCenterRepository: i()),
          export: true,
        ),
    Bind((i) => GetMedicalCenterDetailsUsecase(iMedicalCenterRepository: i()), export: true),
    Bind((i) => AddMedicUsecase(i()),export: true),
        Bind((i) => MedicalCenterBloc(), export: true),
    Bind((i) => MeusMedicosBloc(), export: true),
    Bind((i) => AddMedicBloc(), export: true),
    Bind((i) => MedicalCenterDetailBloc(), export: true)
      ];
}
