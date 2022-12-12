import 'package:core_module/external/remote/base_datasource_remote_impl.dart';

import '../../model/medic_model.dart';

abstract class IGetAllMyMedicsDatasourceRemote extends BaseDatasourceRemoteImpl{
  Future<List<MedicModel>> getAllMyMedics(String id);
}