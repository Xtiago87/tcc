import 'package:core_module/infra/models/paciente_model.dart';

abstract class IPatientDatasource{
  Future<List<PacienteModel>> getAllMyPatients();
  Future<PacienteModel> getPatientDetails();
}