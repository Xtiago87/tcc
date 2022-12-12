
import 'package:core_module/external/remote/base_datasource_remote_impl.dart';

import '../../model/medic_model.dart';

abstract class IGetMedicalCenterDetailsDatasourceRemote extends BaseDatasourceRemoteImpl{

  Future<List<MedicModel>> getMedicalCenterDetails(int id);

}