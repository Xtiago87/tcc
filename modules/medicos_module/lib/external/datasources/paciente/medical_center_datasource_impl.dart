import 'package:core_module/domain/error/failure.dart';
import 'package:medicos_module/infra/datasource/imedical_center_datasource.dart';
import 'package:medicos_module/infra/datasource/remote/iadd_medical_center_datasource_remote.dart';
import 'package:medicos_module/infra/datasource/remote/iget_all_medical_centers_datasource_remote.dart';
import 'package:medicos_module/infra/datasource/remote/iget_medical_center_details_datasource_remote.dart';
import 'package:medicos_module/infra/model/medic_model.dart';

import '../../../infra/model/medical_center_model.dart';

class MedicalCenterDatasourceImpl extends IMedicalCenterDatasource{

  final IGetMedicalCenterDetailsDatasourceRemote iGetMedicalCenterDetailsDatasourceRemote;
  final IGetAllMedicalCentersDatasoureRemote iGetAllMedicalCentersDatasoureRemote;
  final IAddMedicalCenterDatasourceRemote iAddMedicalCenterDatasourceRemote;

  MedicalCenterDatasourceImpl(this.iGetMedicalCenterDetailsDatasourceRemote, this.iGetAllMedicalCentersDatasoureRemote, this.iAddMedicalCenterDatasourceRemote);



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

  @override
  Future addMedicalCenter(form) async {
    try{
      return await iAddMedicalCenterDatasourceRemote.addMedicalCenter(form);
    } on Failure {
      rethrow;
    }
  }

}