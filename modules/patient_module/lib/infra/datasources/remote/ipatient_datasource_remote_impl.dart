import 'package:core_module/external/remote/base_datasource_remote_impl.dart';
import 'package:core_module/infra/models/paciente_model.dart';

abstract class IPatientDatasourceRemoteImpl extends BaseDatasourceRemoteImpl{
  Future<List<PacienteModel>> getAllMyPatients();
  Future<PacienteModel> getPatientDetails();
}