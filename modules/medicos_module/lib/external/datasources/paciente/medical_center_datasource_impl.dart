import 'package:core_module/domain/error/failure.dart';
import 'package:medicos_module/domain/entities/medical_center_entity.dart';
import 'package:medicos_module/infra/datasource/imedical_center_datasource.dart';
import 'package:medicos_module/infra/datasource/remote/iget_all_medical_centers_datasource_remote.dart';
import 'package:medicos_module/infra/datasource/remote/iget_medical_center_details_datasource_remote.dart';
import 'package:medicos_module/infra/model/medic_model.dart';

import '../../../domain/entities/medic_entity.dart';
import '../../../infra/model/medical_center_model.dart';

class MedicalCenterDatasourceImpl extends IMedicalCenterDatasource{

  final IGetMedicalCenterDetailsDatasourceRemote iGetMedicalCenterDetailsDatasourceRemote;
  final IGetAllMedicalCentersDatasoureRemote iGetAllMedicalCentersDatasoureRemote;

  MedicalCenterDatasourceImpl(this.iGetMedicalCenterDetailsDatasourceRemote, this.iGetAllMedicalCentersDatasoureRemote);



  @override
  Future<List<MedicModel>> getMedicalCenterDetails(int id) async {
    try{
      return await iGetMedicalCenterDetailsDatasourceRemote.getMedicalCenterDetails(id);
    } on Failure {
      rethrow;
    }
  }

  @override
  Future<List<MedicalCenterModel>> listAllMedicalCenters() async {
    try{
      return await iGetAllMedicalCentersDatasoureRemote.getAllMedicalCenters();
    } on Failure {
      rethrow;
    }
  }

}