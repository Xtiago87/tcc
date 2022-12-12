import 'package:core_module/external/remote/base_datasource_remote_impl.dart';
import 'package:medicos_module/infra/model/medical_center_form_model.dart';

abstract class IAddMedicalCenterDatasourceRemote extends BaseDatasourceRemoteImpl{
  Future<dynamic> addMedicalCenter(MedicalCenterFormModel medicalCenterFormModel);
}