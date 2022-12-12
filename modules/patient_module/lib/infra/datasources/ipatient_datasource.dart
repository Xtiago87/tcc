import 'package:core_module/infra/models/paciente_model.dart';

abstract class IPacienteDatasource{
  Future<List<PacienteModel>> getAllMyPatients(int id);
  Future<PacienteModel> getPatientDetails();
}