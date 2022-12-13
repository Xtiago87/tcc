import 'package:core_module/external/remote/base_datasource_remote_impl.dart';
import 'package:core_module/infra/models/paciente_model.dart';

import '../../mapper/paciente_mapper.dart';

abstract class IPatientDatasourceRemoteImpl extends BaseDatasourceRemoteImpl{
  Future<List<PacienteModel>> getAllMyPatients(int id);
  Future<DetalhesPacienteModel> getPatientDetails(int id, int pacienteId);
}