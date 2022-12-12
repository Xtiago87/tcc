import 'package:core_module/external/remote/base_datasource_remote_impl.dart';

import '../../model/medical_center_model.dart';

abstract class IGetAllMedicalCentersDatasoureRemote extends BaseDatasourceRemoteImpl{
  Future<List<MedicalCenterModel>> getAllMedicalCenters();
}