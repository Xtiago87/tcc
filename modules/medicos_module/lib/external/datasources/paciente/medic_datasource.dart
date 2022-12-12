import 'package:core_module/core_module.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:core_module/external/local/perfil_datasource_local_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicos_module/infra/datasource/imedic_datasource.dart';
import 'package:medicos_module/infra/datasource/remote/iget_all_my_medics_datasource_remote.dart';
import 'package:medicos_module/infra/datasource/remote/irequest_to_link_datasource_remote.dart';
import 'package:medicos_module/infra/model/medic_model.dart';

class MedicDatasourceImpl extends IMedicDatasource{

  final IGetAllMyMedicsDatasourceRemote iGetAllMyMedicsDatasourceRemote;
  final IRequestToLinkDatasourceRemote iRequestToLinkDatasourceRemote;

  MedicDatasourceImpl(this.iGetAllMyMedicsDatasourceRemote, this.iRequestToLinkDatasourceRemote);

  @override
  Future<List<MedicModel>> getAllMyMedics(String id) async {
    try{
      return iGetAllMyMedicsDatasourceRemote.getAllMyMedics(id);
    } on Failure{
      rethrow;
    }
  }

  @override
  Future addMedic(String token, String id) {
    try{
      return iRequestToLinkDatasourceRemote.requestToLink(token, id);
    } on Failure{
      rethrow;
    }
  }

}